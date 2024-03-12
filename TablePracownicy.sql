drop table if exists Pracownicy;
create table Pracownicy
(
    /*
    Pracownicy (Employees):
    EmployeeID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    FirstName (VARCHAR, NOT NULL)
    LastName (VARCHAR, NOT NULL)
    Position (VARCHAR, NOT NULL)
    Email (VARCHAR, NOT NULL, UNIQUE)
    Phone (VARCHAR, NOT NULL, UNIQUE)
    HireDate (DATE, NOT NULL)
    HourlyRate (DECIMAL, NOT NULL)
    */

    id          int primary key auto_increment not null unique,
    first_name  VARCHAR(30)                    not null,
    fast_name   VARCHAR(30)                    not null,
    position    VARCHAR(30)                    not null,
    email       VARCHAR(100)                   not null unique,
    phone       VARCHAR(13)                    not null unique,
    hire_date   DATE                           not null,
    hourly_rate DECIMAL                        not null
);
