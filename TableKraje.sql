drop table if exists Kraje;
create table Kraje
(
    /*
    Kraje (Countries):
    CountryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    */
    id   int primary key auto_increment not null unique,
    name varchar(30)                    not null unique
);