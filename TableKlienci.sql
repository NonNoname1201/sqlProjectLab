drop table if exists Klienci; /* DELETES ALL DATA IN THE TABLE */
create table Klienci
(
    /*
    Klienci (Customers):
    CustomerID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    FirstName (VARCHAR, NOT NULL)
    LastName (VARCHAR, NOT NULL)
    Email (VARCHAR, NOT NULL, UNIQUE)
    Phone (VARCHAR, NOT NULL, UNIQUE)
    Address (VARCHAR, NOT NULL)
    City (VARCHAR, NOT NULL)
      */
    id         int auto_increment
        primary key not null unique,
    first_name varchar(30)                        not null,
    last_name  varchar(30)                        not null,
    email      varchar(100)                       not null unique,
    phone      varchar(13)                                not null unique,
    address    varchar(100)                       not null,
    city       varchar(31)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null
);
