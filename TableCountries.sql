create table countries
(
    /*
Countries (Countries):
CountryID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)
    */
    id   int primary key not null auto_increment,
    name varchar(60)     not null unique
);

insert into countries (name) values ('Poland');
insert into countries (name) values ('Germany');
insert into countries (name) values ('France');
insert into countries (name) values ('Italy');
insert into countries (name) values ('Spain');