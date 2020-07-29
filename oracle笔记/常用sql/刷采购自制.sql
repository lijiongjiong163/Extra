select * from mdm_erpmnsx_0723
delete from mdm_erpmnsx_0723
--Ë¢²É¹º×ÔÖÆ
update mdm_wlzsh_code  t3 set  t3.desc48 = (select what from mdm_erpmnsx_0723 where desc12 = t3.desc12 )
where t3.desc12 in(
select t2.desc12 from mdm_erpmnsx_0723 t1 left join mdm_wlzsh_code t2 on t1.desc12 = t2.desc12 where t2.desc12 is not null)


