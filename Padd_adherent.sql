SET serveroutput ON;
-- 1. insert adherent to table adherets
create or replace procedure add_adherent(id in adherents.adherent_id%type,firstName in adherents.first_name%type,lastName in adherents.last_name%type,dateInscription in adherents.date_inscription%type)is
id_found EXCEPTION;
v_id integer;
begin
--raise exception when id found on the table so u cannot add it
select count(*) into v_id from adherents where adherent_id=id;
if v_id=1 then raise id_found;
end if;
insert into adherents(adherent_id,first_name,last_name,date_inscription)values(id,firstName,lastName,dateInscription);
EXCEPTION
when id_found then
    rollback;
    dbms_output.put_line('this id already taken ');
end;
/