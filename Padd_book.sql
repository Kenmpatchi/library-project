SET serveroutput ON;
create or replace procedure add_book(id in books.book_id%type,title in books.title%type,author_id in books.author_id%type,nb_exemplaires books.nb_exemplaires%type)is
id_found EXCEPTION;
n books.book_id%type;
begin
--raise exception when id found on the table so u cannot add it
select count(*) into n from books where book_id=id;
if n=1 then raise id_found;
end if;
insert into books(book_id,title,author_id,nb_exemplaires)values(id,title,author_id,nb_exemplaires);
EXCEPTION
when id_found then
    dbms_output.put_line('this id already taken :');
when others then
    rollback;
    dbms_output.put_line('error: '||SQLERRM);
end;
/