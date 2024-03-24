create table employees
(
    /*
Employees (Employees):
EmployeeID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
FirstName (VARCHAR, NOT NULL)
LastName (VARCHAR, NOT NULL)
PositionID (INT, FOREIGN KEY REFERENCES Positions(PositionID), NOT NULL) n:1 with Positions
Email (VARCHAR, NOT NULL, UNIQUE)
Phone (VARCHAR, NOT NULL, UNIQUE)
HireDate (DATE, NOT NULL)
HourlyRate (DECIMAL, NOT NULL)
    */

    id          int primary key auto_increment not null,
    name        varchar(30)                    not null,
    surname     varchar(30)                    not null,
    position_id int                            not null,
    email       varchar(30)                    not null,
    phone       varchar(13)                    not null,
    hire_date   date                           not null,
    hourly_rate decimal                        not null,
    foreign key (position_id) references positions (id)
);

insert into employees (name, surname, position_id, email, phone, hire_date, hourly_rate)
values ('John', 'Doe', 1, 'qwer@qwer.qw', '123456789', '2020-01-01', 20),
       ('Jane', 'Doe', 2, 'qwer1@qwer.qw', '123456789', '2020-01-01', 15),
       ('Jack', 'Doe', 3, 'qwer2@qwer.qw', '123456789', '2020-01-01', 12),
       ('Jill', 'Doe', 4, 'qwer3@qwer.qw', '123456789', '2020-01-01', 11),
       ('Jim', 'Doe', 5, 'qwer4@qwer.qw', '123456789', '2020-01-01', 17);
