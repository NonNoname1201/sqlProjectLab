create table if not exists Pracownicy
(
    /*
    Pracownicy (Employees):
    EmployeeID (INT, PRIMARY KEY)
    FirstName (VARCHAR)
    LastName (VARCHAR)
    Position (VARCHAR)
    Email (VARCHAR)
    Phone (VARCHAR)
    HireDate (DATE)
    Salary (DECIMAL)
    */

    id         int primary key auto_increment not null unique,
    first_name VARCHAR(30)                    not null,
    fast_name  VARCHAR(30)                    not null,
    position   VARCHAR(30)                    not null,
    email      VARCHAR(100)                   not null,
    phone      VARCHAR(13)                    not null,
    hire_date  DATE                           not null,
    salary     DECIMAL                        not null
);
