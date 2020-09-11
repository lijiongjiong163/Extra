
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
  
