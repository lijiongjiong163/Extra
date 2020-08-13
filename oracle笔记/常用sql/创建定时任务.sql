--创建一个dblink访问正式系统数据
create database link MDM_to_UAT
  connect to lijiongjiong identified by "ljj2019"
 using '(DESCRIPTION =(ADDRESS_LIST =(ADDRESS =(PROTOCOL = TCP)(HOST = 172.16.8.129)(PORT = 1521)))(CONNECT_DATA =(SERVICE_NAME = szqmdm)))';  
 --创建一个表记录定时任务触发时间
create table job_table(run_time date);

  --创建实现drop if exists 功能的存储过程
  create or replace procedure proc_dropifexists(p_table in varchar2) is
  v_count number(10);
begin
  select count(*)
    into v_count
    from user_objects
   where object_name = upper(p_table);
  if v_count > 0 then
    execute immediate 'drop table ' || p_table || ' cascade constraints';
  end if;
end;
--查看这个存储过程
SELECT text FROM user_source WHERE NAME = upper('job_proc') ORDER BY line;

  --创建一个存储过程，执行想要做的操作，并将调用时间写入job_table表
create or replace procedure job_proc is
begin
  --调用drop_if_exists
  proc_dropifexists('mdm_everyday_job');
  --建表
  execute immediate'
  create table mdm_everyday_job as(
    select t1.desc12, --物料编码
           t1.DESC48, --工艺类型
           t1.DESC10, --生命周期状态编码
           t1.desc89, --生命周期状态名称
           t1.desc2 --计量单位
      from szqmdm.mdm_wlzsh_code@mdm_to_uat t1, mdm_wlzsh_code t2
     where t1.desc12 = t2.desc12
       and (t1.desc2 != t2.desc2 or t1.desc48 != t2.desc48 or
           t1.desc10 != t2.desc10))';
  --停触发器
  execute immediate'alter trigger update_mdm_wlzsh_code disable';
  --刷数据
  update mdm_wlzsh_code a
     set a.desc48 =
         (select b.desc48 from mdm_everyday_job b where b.desc12 = a.desc12),
         a.desc10 =
         (select b.desc10 from mdm_everyday_job b where b.desc12 = a.desc12),
         a.desc2 =
         (select b.desc2 from mdm_everyday_job b where b.desc12 = a.desc12),
         a.desc89 =
         (select b.desc89 from mdm_everyday_job b where b.desc12 = a.desc12)
   where a.desc12 in (select DISTINCT desc12 from mdm_everyday_job);
  --启动触发器
  execute immediate'alter trigger update_mdm_wlzsh_code enable';
  --记录调用时间
  insert into job_table (run_time) values (sysdate);
  commit;
end;

--创建一个定时job
declare
  job number;
BEGIN
  DBMS_JOB.SUBMIT(JOB       => job, /*自动生成JOB_ID*/
                  WHAT      => 'job_proc;', /*需要执行的存储过程名称或SQL语句*/
                  NEXT_DATE => sysdate + 3 / (24 * 60), /*初次执行时间-下一个3分钟*/
                  INTERVAL  => 'trunc(sysdate,''mi'')+1/(24*60)' /*每隔1分钟执行一次*/);
  commit;
end;

--设置触发时间为每八小时一次
begin dbms_job.interval(6, interval => 'trunc(sysdate,''mi'')+12/24'); end;
--设置下次触发时间
begin
dbms_job.next_date(6,next_date => sysdate + 5 / 24 );
end;
--查看执行记录
select * from job_table
--查看这个定时job
select * from user_jobs;
--清除记录
delete from job_table
