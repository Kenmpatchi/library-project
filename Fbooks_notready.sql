SET serveroutput ON;
create or replace function nb_NotReadys(id in readys.adherent_id%type)return number is
nb integer;
begin
    select count(*)into nb from readys where adherent_id=id and date_retour is null;
    return nb;
EXCEPTION
when no_data_found then
    rollback;
    dbms_output.put_line('invalide id');
when others then
    rollback;
    dbms_output.put_line('error: '||SQLERRM);
end;
/