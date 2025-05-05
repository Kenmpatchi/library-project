SET serveroutput ON;
create or replace procedure modify_adherent(id in adherents.adherent_id%type,new_FN in adherents.first_name%type,new_LN in adherents.last_name%type)is
Noid_found EXCEPTION;
n integer;
begin
--raise exception when id not found
select count(*)into n from adherents where adherent_id=id;
if v_id=id then raise Noid_found;
end if;  
update adherents
set first_name=new_FN,last_name=new_LN
where adherent_id=id;
EXCEPTION
when Noid_found then
    rollback;
    dbms_output.put_line('invalide id');
when others then
    rollback;
    dbms_output.put_line('error: '||SQLERRM);
end;
/