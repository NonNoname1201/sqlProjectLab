create table if not exists Uzytkownicy
(
    /*
    Użytkownicy (Users):
    UserID (INT, PRIMARY KEY)
    Username (VARCHAR)
    Password (VARCHAR)
    Role (ENUM('admin', 'user'))
    */
    id       int auto_increment primary key not null unique,
    username varchar(255)                   not null unique,
    password varchar(255)                   not null,
    role     enum ('admin', 'user')
);