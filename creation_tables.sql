create table authors(
    author_id integer primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null
);
create table adherents(
    adherent_id integer primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    date_inscription Date not null
);
create table books(
    book_id integer primary key,
    title varchar(50) not null,
    author_id integer,
    nb_exemplaires integer not null,
    constraint foreign key (author_id) references authors(author_id)
);

create table readys(
    ready_id integer primary key,
    book_id integer not null,
    adherent_id integer not null,
    date_ready date not null,
    date_retour date not null,
    constraint foreign key (book_id) references books(book_id),
    constraint foreign key (adherent_id) references adherents(adherent_id)
);