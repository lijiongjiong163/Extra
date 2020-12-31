
update szqmdm.mdm_wlzsh_synflag set synflag='1' where synseq ='12892313' and codeid in (
select codeid from szqmdm.mdm_wlzsh_code where desc12 in 
(
select desc12 from mdm_erpmnsx_0719@to_mdm_uat
)
)


select count(*) from mdm_erpmnsx_0719

select t2.desc12,t1.desc12,t1.desc1 from szqmdm.mdm_wlzsh_code t1 right join mdm_erpmnsx_0719@to_mdm_uat t2 on t1.desc12 = t2.desc12
