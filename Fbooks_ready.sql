SET serveroutput ON;
create or replace function stock_available(id in books.book_id%type)return number is
nb integer;
begin
    select nb_exemplaires into nb from books where book_id=id;
    nb:=nb-nb-nb_NotReadys(id); 
return nb;
exception
when no_data_found then
    rollback;
    dbms_output.put_line('invalide id');
when others then
    rollback;
    dbms_output.put_line('error: '||SQLERRM);
end;
/