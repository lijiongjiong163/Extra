
--成品1
  update mdm_wlzsh_code t1 set desc48 =(
  select desc48 from szqmdm.mdm_wlzsh_code@MDM_TO_UAT2 t2 where t2.desc12=t1.desc12 
  ),
  desc10=(
    select desc10 from szqmdm.mdm_wlzsh_code@MDM_TO_UAT2 t2 where t2.desc12=t1.desc12 

  ),
  desc89=(
    select desc89 from szqmdm.mdm_wlzsh_code@MDM_TO_UAT2 t2 where t2.desc12=t1.desc12 
  )
  where  t1.desc12 in(
 select * from mdm_erpmnsx_01
  )


--成品2
  
    insert into mdm_wlzsh_code 
   select * from szqmdm.mdm_wlzsh_code@MDM_TO_UAT2 where desc12 in  
   (
   select * from mdm_erpmnsx_01
  )and  desc12 not in (
  select t1.desc12  from mdm_erpmnsx_01 t1 inner join mdm_wlzsh_code  t2 on t1.desc12= t2.desc12 
  )
 --发数据 
  update szqmdm.mdm_wlzsh_synflag@mdm_to_uat2 set synflag='1' where synseq ='12892313' and codeid in (
select codeid from szqmdm.mdm_wlzsh_code@mdm_to_uat2 where desc12 in(
select t2.desc12 from mdm_erpmnsx_01 t1 inner join szqmdm.mdm_wlzsh_code@mdm_to_uat2 t2 on t1.desc12=t2.desc12
)
)
  


SELECT text FROM user_source WHERE NAME =upper('SZQMDM.PRO_ERPPL_CODE_ZJB') and type='PROCEDURE';
BEGIN
  CALL PRO_ERPPL_CODE_ZJB();
  END;
  
 select  text  from  user_source  where name  =  'runbyparmeters'  order  by  line;


 
begin
  -- Call the procedure
  PRO_ERPPL_CODE_ZJB();
end;

delete from mdm_wlzsh_code where desc1='sgsg' and desc16='N'
select * from mdm_wlzsh_code where desc1='sgsg' and desc16='N' for update
H1534AVBABC1234A12
select * from mdm_wlflq_code
select * from mdm_wlfl_code

select * from szqmdm.mdm_wlflq_code
select * from szqmdm.mdm_wlfl_code
