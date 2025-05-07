CREATE OR REPLACE PACKAGE pkg_library AS
    procedure add_adherent(id in adherents.adherent_id%type,firstName in adherents.first_name%type,lastName in adherents.last_name%type,dateInscription in adherents.date_inscription%type);
    procedure add_book(id in books.book_id%type,title in books.title%type,author_id in books.author_id%type,nb_exemplaires in books.nb_exemplaires%type);
    function nb_NotReadys(id in readys.adherent_id%type)return number;
    function stock_available(id in books.book_id%type)return number;
END pkg_library;