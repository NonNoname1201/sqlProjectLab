create table Countries
(
    /*
Countries (Countries):
CountryID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)
    */
    id   int primary key not null auto_increment,
    name varchar(60)     not null unique
);