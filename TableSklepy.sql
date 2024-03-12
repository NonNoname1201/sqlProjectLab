drop table if exists Sklepy;
create table if not exists Sklepy
(
    /*
    Sklepy (Stores):
    StoreID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL)
    Address (VARCHAR, NOT NULL, UNIQUE)
    City (VARCHAR, NOT NULL)
    Country (VARCHAR, NOT NULL)
    */
    id      int primary key auto_increment not null unique,
    name    varchar(30)                    not null,
    address varchar(30)                    not null unique,
    city    varchar(30)                    not null,
    country varchar(30)                    not null
);