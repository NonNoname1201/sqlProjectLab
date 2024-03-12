drop table if exists Uzytkownicy;
create table if not exists Uzytkownicy
(
    /*
    Użytkownicy (Users):
    UserID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), UNIQUE)
    EmployeeID (INT, FOREIGN KEY REFERENCES Employees(EmployeeID), UNIQUE)
    Username (VARCHAR, NOT NULL)
    Password (VARCHAR, NOT NULL)
    Role (ENUM('admin', 'user'), NOT NULL)
    */
    id          int auto_increment primary key not null unique,
    customer_id int                           unique,
    foreign key (customer_id) references klienci(id),
    employee_id int                           unique,
    foreign key (employee_id) references pracownicy(id),
    username    varchar(30)                    not null unique,
    password    varchar(32)                    not null,
    role        enum ('admin', 'user')
);