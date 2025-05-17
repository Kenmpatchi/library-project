SET serveroutput ON;
create or replace procedure modify_stock_book(id in books.book_id%type,new_stock in books.nb_exemplaires%type)is
Noid_found EXCEPTION;
n integer;
begin
select count(*) into n from books where book_id=id;
if n=1 then raise Noid_found;
end if; 
update books
set nb_exemplaires=new_stock
where book_id=id;
EXCEPTION
when Noid_found then
    dbms_output.put_line('invalide id');
when others then
    rollback;
    dbms_output.put_line('error: '||SQLERRM);
end;
/