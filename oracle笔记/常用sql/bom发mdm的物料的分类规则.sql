create or replace trigger szqmdm.insert_wlsjgysx_time
  before insert or update
  on szqmdm.MDM_WLSJGYSX_ZJB
  for each row
declare
  -- local variables here
  n number;
  u number;
  v_categorycode varchar2(1000);
  v_categoryname varchar2(1000);
  v_desc12lengthb varchar2(10);
  v_desc12length varchar2(10);
  v_desc12ht varchar2(10);
  m number;
  v_desc17 varchar2(60);
  v_desc48 varchar2(20);
  f number;
  g number;
begin
/*
 if (inserting or updating) then
    :new.time := sysdate;
 --- end if; */
if(inserting or updating) then
  :new.time := sysdate;
  v_desc12lengthb := lengthb(:new.plmnumber);
  v_desc12length:=length(:new.plmnumber);
  v_desc12ht:=SUBSTR(:new.plmnumber,1,2);

   IF (v_desc12lengthb = v_desc12length and v_desc12ht<>'HT') THEN
    :new.jkztw := '1';
      END IF;
   if(v_desc12lengthb <> v_desc12length and v_desc12ht<>'HT') THEN
    :new.jkztw := '2';
          END IF;
    if(v_desc12lengthb <> v_desc12length and v_desc12ht='HT') THEN
    :new.jkztw := '3';
        END IF;
    If(v_desc12lengthb = v_desc12length and v_desc12ht='HT') THEN
    :new.jkztw := '4';
    END IF;

  IF (:new.state       IS NULL) THEN
      :new.isplmmaterial := 'N';
    elsif(:new.state     IS NOT NULL) THEN
      :new.isplmmaterial := 'Y';
    END IF;
  /*
  IF updating THEN
      IF(:new.eecnc IS NULL AND :old.eecnc IS NOT NULL ) THEN
        :new.eecnc  := :old.eecnc;
      END IF;
      IF(:new.eecnc IS not NULL AND (substr(:new.eecnc,1,1) not in ('-','C','S','A','Z','P') )) THEN
        :new.eecnc  := :old.eecnc;
      END IF;
    END IF;

  IF inserting THEN
      IF(:new.eecnc IS not NULL AND (substr(:new.eecnc,1,1) not in ('-','C','S','A','Z','P') )) THEN
      select count(1) into m from mdm_wlzsh_code where desc12=:new.plmnumber;
      IF m=0 THEN
        :new.eecnc  := '';
       END IF;
      IF m>0 THEN
       select desc17 into v_desc17 from mdm_wlzsh_code where desc12=:new.plmnumber;
       :new.eecnc  := v_desc17;
       END IF;
      END IF;
    END IF;
*/

  IF (:new.jkztw ='1') THEN
   IF(:new.eecnc IS NULL) THEN
        select count(1) into m from mdm_wlzsh_code where desc12=:new.plmnumber;
       IF m=0 THEN
        :new.eecnc  := '';
       END IF;
      IF m>0 THEN
       select desc17 into v_desc17 from mdm_wlzsh_code where desc12=:new.plmnumber;
        IF(substr(v_desc17,1,1)  in ('-','C','S','A','Z','P','Q','L') ) THEN
       :new.eecnc  := v_desc17;
       END IF;
        IF(substr(v_desc17,1,1) not in ('-','C','S','A','Z','P','Q','L') ) THEN
       :new.eecnc  := '';
       END IF;
       END IF;
      END IF;
   IF(:new.eecnc IS not NULL AND (substr(:new.eecnc,1,1) not in ('-','C','S','A','Z','P') )) THEN
        select count(1) into m from mdm_wlzsh_code where desc12=:new.plmnumber;
         IF m=0 THEN
        :new.eecnc  := '';
       END IF;
      IF m>0 THEN
       select desc17 into v_desc17 from mdm_wlzsh_code where desc12=:new.plmnumber;
        IF(substr(v_desc17,1,1)  in ('-','C','S','A','Z','P','Q','L') ) THEN
       :new.eecnc  := v_desc17;
       END IF;
        IF(substr(v_desc17,1,1) not in ('-','C','S','A','Z','P','Q','L') ) THEN
       :new.eecnc  := '';
       END IF;
       END IF;
      END IF;
  END IF;

  select count(*) into n from mdm_wlbm_code where  auditflag='2' and desc12 = :new.plmnumber;

  if (n = '1') then
    select count(*) into g from mdm_wlbm_code where auditflag='2' and desc12 = :new.plmnumber and substr(categorycode,1,2) in ('10','11','12','13','14','15','16','17','18','19','20','21','28') or :new.categorycode in ('9999099');
   if(g=1) then
    if(:new.materialname like '%再加工图%') then
      :new.categorycode := '9999002';
      :new.categoryname := '再加工图';
      update mdm_wlbm_code set desc1 = :new.materialname,categorycode = '9999002',categoryname = '再加工图' where desc12 = :new.plmnumber;
      update mdm_wlbm_codevalue set propertyvalue = :new.materialname where propertycode = 'MaterialName' and codeid = (select codeid from
       mdm_wlbm_code where desc12 = :new.plmnumber);
      update mdm_wlbm_codevalue set categorycode = '9999002' where codeid = (select codeid from mdm_wlbm_code where desc12 = :new.plmnumber);
    end if;
    if(:new.materialname like '%图%' and :new.materialname not like '%再加工图%') then
      :new.categorycode := '9999001';
      :new.categoryname := '装配图';
      update mdm_wlbm_code set desc1 = :new.materialname,categorycode = '9999001',categoryname = '装配图' where desc12 = :new.plmnumber;
      update mdm_wlbm_codevalue set propertyvalue = :new.materialname where propertycode = 'MaterialName' and codeid = (select codeid from
      mdm_wlbm_code where desc12 = :new.plmnumber);
      update mdm_wlbm_codevalue set categorycode = '9999001' where codeid = (select codeid from mdm_wlbm_code where desc12 = :new.plmnumber);
    end if;
    if(:new.materialname like '%参数表%') then
      :new.categorycode := '9999001';
      :new.categoryname := '装配图';
      update mdm_wlbm_code set desc1 = :new.materialname,categorycode = '9999001',categoryname = '装配图' where desc12 = :new.plmnumber;
      update mdm_wlbm_codevalue set propertyvalue = :new.materialname where propertycode = 'MaterialName' and codeid = (select codeid from
      mdm_wlbm_code where desc12 = :new.plmnumber);
      update mdm_wlbm_codevalue set categorycode = '9999001' where codeid = (select codeid from mdm_wlbm_code where desc12 = :new.plmnumber);
    end if;
    if(:new.materialname not like '%图%' and :new.materialname not like '%参数表%') then
      select categorycode into v_categorycode from mdm_wlbm_code where desc12 = :new.plmnumber  and auditflag = '2';
      select categoryname into v_categoryname from mdm_wlbm_code where desc12 = :new.plmnumber  and auditflag = '2';
      :new.categorycode := v_categorycode;
      :new.categoryname := v_categoryname;
    end if;
     end if;

   if(g<>1) then
      select categorycode into v_categorycode from mdm_wlbm_code where desc12 = :new.plmnumber  and auditflag = '2';
      select categoryname into v_categoryname from mdm_wlbm_code where desc12 = :new.plmnumber  and auditflag = '2';
      :new.categorycode := v_categorycode;
      :new.categoryname := v_categoryname;
     end if;

  end if;


  if ( n = '0') then
    select count(*) into u from mdm_wlzsh_code where desc12 = :new.plmnumber;
    if(u='1') then
      select categorycode into v_categorycode from mdm_wlzsh_code where desc12 = :new.plmnumber;
      select categoryname into v_categoryname from mdm_wlzsh_code where desc12 = :new.plmnumber;
      :new.categorycode := v_categorycode;
      :new.categoryname := v_categoryname;
    end if;

    if(u = '0') then
         if(substr(:new.plmnumber,0,1)='F') then

           if(substr(:new.plmnumber,0,3)in('FA0','FA1','FB0','FB1','FBC1')) then
             :new.categorycode := '6140030';
             :new.categoryname := 'BOM管子合件';
           elsif(substr(:new.plmnumber,0,3)in('FDC','FJC')) then
             :new.categorycode := '6140040';
             :new.categoryname := '内饰合件';
           else
             :new.categorycode := '6140050';
             :new.categoryname := 'BOM合件';
           end if;

         end if;
         if(substr(:new.plmnumber,0,1)<>'F') then
           if(substr(:new.plmnumber,0,3)='DH9' and substr(:new.plmnumber,9,1)='H') then
             :new.categorycode := '0602010';
             :new.categoryname := '整车';
           elsif(substr(:new.plmnumber,0,3)='DH9' and substr(:new.plmnumber,9,1)='K') then
             :new.categorycode := '0602012';
             :new.categoryname := '整车选用';
           elsif(substr(:new.plmnumber,0,3)='JH9' and substr(:new.plmnumber,9,1)='H') then
             :new.categorycode := '0602610';
             :new.categoryname := '特种车';
           elsif(substr(:new.plmnumber,0,3)='JH9' and substr(:new.plmnumber,9,1)='K') then
             :new.categorycode := '0602612';
             :new.categoryname := '特种车选用';
           elsif(substr(:new.plmnumber,0,3)='DH1') then
             :new.categorycode := '0602020';
             :new.categoryname := '驾驶室';
           elsif(substr(:new.plmnumber,0,3)='JH1') then
             :new.categorycode := '0602620';
             :new.categoryname := '特种驾驶室';
           elsif(substr(:new.plmnumber,0,3)='DH8') then
             :new.categorycode := '0602030';
             :new.categoryname := '上装';
           elsif(substr(:new.plmnumber,0,3)='JH8') then
             :new.categorycode := '0602630';
             :new.categoryname := '特种上装';
           elsif(substr(:new.plmnumber,0,2)='DC') then
             :new.categorycode := '0606010';
             :new.categoryname := '民子组';
           elsif(substr(:new.plmnumber,0,2)='JC') then
             :new.categorycode := '0606610';
             :new.categoryname := '特种车子组';
           elsif(substr(:new.plmnumber,0,2)='DK') then
             :new.categorycode := '0604010';
             :new.categoryname := '民选用';
           elsif(substr(:new.plmnumber,0,2)='JK') then
             :new.categorycode := '0604610';
             :new.categoryname := '特种车选用';
           elsif(substr(:new.plmnumber,0,2)IN('MT','M1','G1','M0','G0')) then
             :new.categorycode := '6140030';
             :new.categoryname := 'BOM管子合件';
           elsif(substr(:new.plmnumber,0,2)IN('KC','KH')) then
             :new.categorycode := '9880050';
             :new.categoryname := '技术中心明细';
           elsif(substr(:new.plmnumber,0,2)='SX') then
             :new.categorycode := '9810050';
             :new.categoryname := '军车明细';
           elsif(substr(:new.plmnumber,0,2)IN('DZ','JZ') AND :new.materialname like '%再加工图%') then
             :new.categorycode := '9999002';
             :new.categoryname := '再加工图';
           elsif(substr(:new.plmnumber,0,2)IN('DZ','JZ') AND :new.materialname like '%图%' and :new.materialname not like '%再加工图%') then
             :new.categorycode := '9999001';
             :new.categoryname := '装配图';
           elsif(substr(:new.plmnumber,0,2)IN('DZ','JZ') AND :new.materialname like '%参数表%') then  
                :new.categorycode := '9999001';
                :new.categoryname := '装配图';
            elsif(substr(:new.plmnumber,-2,2)='MX' and trim(translate(substr(:new.plmnumber,0,1),'0123456789',' ')) is NULL) then
               :new.categorycode := '6140050';
               :new.categoryname := 'BOM合件';
            else
               :new.categorycode := '6140050';
               :new.categoryname := 'BOM合件';
           end if;
         end if;
   -- :new.categorycode := '9810020';
    --  :new.categoryname := '自产车非PLM件';
     end if;

/*
 if( u = '0' and nvl(:new.categorycode,1)<> '9810020' and substr(:new.plmnumber,0,1)='F') then
         if(substr(:new.plmnumber,1,3) in ('FA0','FA1','FB0','FB1','FC1') ) then
        :new.categorycode := '6140030';
        :new.categoryname := 'BOM管子合件';
      end if;
      if(substr(:new.plmnumber,1,3) not in ('FA0','FA1','FB0','FB1','FC1') ) then
        :new.categorycode := '6140050';
        :new.categoryname := 'BOM合件';
      end if;
    end if;

    if( u = '0' and nvl(:new.categorycode,1)<> '9810020' and substr(:new.plmnumber,0,1)<>'F') then
         if(:new.categorycode is null) then
        :new.categorycode := '6140050';
        :new.categoryname := 'BOM合件';
      end if;
          if(:new.materialname like '%再加工图%') then
        :new.categorycode := '9999002';
        :new.categoryname := '再加工图';
      end if;
      if(:new.materialname like '%图%' and :new.materialname not like '%再加工图%') then
        :new.categorycode := '9999001';
        :new.categoryname := '装配图';
      end if;
      if(:new.materialname like '%参数表%') then
        :new.categorycode := '9999001';
        :new.categoryname := '装配图';
      end if;
      if(substr(:new.plmnumber,0,3)='DH9' and substr(:new.plmnumber,9,1)='H') then
        :new.categorycode:='0602010' ;
        :new.categoryname:='整车';
      end if;
      if(substr(:new.plmnumber,0,3)='DH9' and substr(:new.plmnumber,9,1)='K') then
        :new.categorycode:='0602012' ;
        :new.categoryname:='整车选用';
      end if;
      if(substr(:new.plmnumber,0,3)='JH9' and substr(:new.plmnumber,9,1)='H') then
        :new.categorycode:='0602610' ;
        :new.categoryname:='特种车';
      end if;
      if(substr(:new.plmnumber,0,3)='JH9' and substr(:new.plmnumber,9,1)='K') then
        :new.categorycode:='0602012' ;
        :new.categoryname:='特种车选用';
      end if;
      if(substr(:new.plmnumber,0,3)='DH1') then
        :new.categorycode:='0602020' ;
        :new.categoryname:='驾驶室';
      end if;
      if(substr(:new.plmnumber,0,3)='JH1') then
        :new.categorycode:='0602620' ;
        :new.categoryname:='特种驾驶室';
      end if;
      if(substr(:new.plmnumber,0,3)='DH8') then
        :new.categorycode:='0602030' ;
        :new.categoryname:='上装';
      end if;
      if(substr(:new.plmnumber,0,3)='JH8') then
        :new.categorycode:='0602630' ;
        :new.categoryname:='特种上装';
      end if;
      if(substr(:new.plmnumber,0,2)='DK') then
        :new.categorycode:='0604010' ;
        :new.categoryname:='民选用';
      end if;
      if(substr(:new.plmnumber,0,2)='JK') then
        :new.categorycode:='0604610' ;
        :new.categoryname:='特种车选用';
      end if;
      if(substr(:new.plmnumber,0,2)='DC') then
        :new.categorycode:='0606010' ;
        :new.categoryname:='民子组';
      end if;
      if(substr(:new.plmnumber,0,2)='JC') then
        :new.categorycode:='0606610' ;
        :new.categoryname:='特种车子组';
      end if;
      if(substr(:new.plmnumber,1,2) in ('MT','M1','G1','M0','G0')) then
        :new.categorycode := '6140030';
        :new.categoryname := 'BOM管子合件';
      end if;
     end if;


*/

  end if;

  if (:new.mtype is null) then
    select count(1) into f from mdm_wlzsh_code where desc12=:new.plmnumber;
  if (f=1) then
  select desc48 into v_desc48 from mdm_wlzsh_code where desc12=:new.plmnumber;
 :new.mtype := v_desc48;
 end if;
   if (f=0) then
 :new.mtype := '';
 end if;
end if;

end if;

end insert_wlsjgysx_time;
