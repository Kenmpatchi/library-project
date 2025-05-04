SET serveroutput ON;
create or replace procedure view_book(id in books.book_id%type)is
author authors.first_name%type;
b_id books.book_id%type;
title books.title%type;
nb books.nb_exemplaires%type;
begin
    select book_id,title ,nb_exemplaires into b_id,title,nb from books where book_id=id;
    select first_name into author from authors where author_id=b_id ;
    dbms_output.put_line(title||author||nb);
EXCEPTION
when no_data_found then
    rollback;
    dbms_output.put_line('invalide id');
when others then
    rollback; 
    dbms_output.put_line('error: '||SQLERRM);
end;
/