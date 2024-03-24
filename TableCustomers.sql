create table customers
(
    /*
Customers (Customers):
CustomerID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
FirstName (VARCHAR, NOT NULL)
LastName (VARCHAR, NOT NULL)
Email (VARCHAR, UNIQUE)
Phone (VARCHAR, NOT NULL, UNIQUE)
AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL, UNIQUE) 1:1 with Address
      */
    id         int primary key auto_increment not null,
    first_name varchar(30)                    not null,
    last_name  varchar(30)                    not null,
    email      varchar(50) unique,
    phone      varchar(15)                    not null unique,
    address_id int                            not null unique,
    foreign key (address_id) references addresses (id)
);

insert into customers (first_name, last_name, email, phone, address_id)
values ('John', 'Doe', 'qwer@qwer.qw', '1234567890', 1),
       ('Jane', 'Doe', 'qwer1@qwer.qw', '2234567890', 2),
       ('Jack', 'Doe', 'qwer2@qwer.qw', '3234567890', 3),
       ('Jill', 'Doe', 'qwer3@qwer.qw', '4234567890', 4),
       ('Jim', 'Doe', 'qwer4@qwer.qw', '5234567890', 5);
