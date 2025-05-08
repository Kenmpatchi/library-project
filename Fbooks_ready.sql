SET serveroutput ON;
create or replace function stock_available(id in books.book_id%type)return number is
nb number;
nbnotreadys number;
begin
    select nb_exemplaires into nb from books where book_id=id;
    select nb_NotReadys(id) into nbnotreadys from dual;
    nb:=nb-nb-nbnotreadys; 
return nb;
exception
when no_data_found then
    dbms_output.put_line('invalide id');
when others then
    dbms_output.put_line('error: '||SQLERRM);
end;
/