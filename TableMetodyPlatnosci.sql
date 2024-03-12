drop table if exists MetodyPlatnosci;
create table MetodyPlatnosci
(
    /*
    13. Metody płatności (PaymentMethods):
    PaymentMethodID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    Description (TEXT, NOT NULL)
    */
    id          int primary key auto_increment not null unique,
    name        varchar(255)                   not null unique,
    description text                           not null
);