--给erp发物料

update mdm_wlzsh_synflag set synflag='1' where synseq ='12892313' and codeid in (
select codeid from mdm_wlzsh_code where desc12 = 'DZ96319511299'
)

select * from mdm_wlzsh_code where desc12='DZ14251150018C1150004' for update
