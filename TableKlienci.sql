create table Klienci
(
    id         int auto_increment
        primary key,
    first_name varchar(30)                        not null,
    last_name  varchar(30)                        not null,
    email      varchar(100)                       not null,
    phone      int                                not null,
    address    varchar(100)                       not null,
    city       varchar(31)                        not null,
    created_at datetime default CURRENT_TIMESTAMP not null
);
