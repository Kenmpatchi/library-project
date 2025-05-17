CREATE OR REPLACE PACKAGE body pkg_library AS
    procedure add_adherent(id in adherents.adherent_id%type,firstName in adherents.first_name%type,lastName in adherents.last_name%type,dateInscription in adherents.date_inscription%type)is
        id_found EXCEPTION;
        n integer;
        begin
        --raise exception when id found on the table so u cannot add it
        select count(*) into n from adherents where adherent_id=id;
        if n=1 then raise id_found;
        end if;
        insert into adherents(adherent_id,first_name,last_name,date_inscription)values(id,firstName,lastName,dateInscription);
        EXCEPTION
        when id_found then
            dbms_output.put_line('this id already taken ');
    end add_adherent;
    procedure add_book(id in books.book_id%type,title in books.title%type,author_id in books.author_id%type,nb_exemplaires books.nb_exemplaires%type)is
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
    end add_book;
    function nb_NotReadys(id in readys.adherent_id%type)return number is
        nb integer;
        begin
            select count(*)into nb from readys where adherent_id=id and date_retour<sysdate;
            return nb;
        EXCEPTION
        when no_data_found then
            dbms_output.put_line('invalide id');
        when others then
            dbms_output.put_line('error: '||SQLERRM);
    end nb_NotReadys;
    function stock_available(id in books.book_id%type)return number is
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
    end stock_available;
END;
/