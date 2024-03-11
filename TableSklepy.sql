create table if not exists Sklepy
(
    /*
    Sklepy (Stores):
    StoreID (INT, PRIMARY KEY)
    Name (VARCHAR)
    Address (VARCHAR)
    City (VARCHAR)
    Country (VARCHAR)
    */
    id      int primary key auto_increment not null unique,
    name    varchar(30)                    not null,
    address varchar(30)                    not null,
    city    varchar(30)                    not null,
    country varchar(30)                    not null
);