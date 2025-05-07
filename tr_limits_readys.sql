create or replace  trigger tr_limits_readys
before insert on readys
for each row 
declare 
    n number ; 
begin
    select count (*)  into n from readys where :new.adherent_id=adherent_id and date_retour=null ;
    if n>3 then 
        raise_application_error(-20400, ' you can not get then 3 copies');
    end if ; 
end ;
/