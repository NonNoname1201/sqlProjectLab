create table addresses
(
    /*
Address (Address):
AddressID (INT PRIMARY KEY NOT NULL)
PostalCode (VARCHAR(5) NOT NULL)
Street (VARCHAR(255) NOT NULL)
CityID (INT, FOREIGN KEY REFERENCES Cities(CityID), NOT NULL) n:1 with Cities
State (VARCHAR(100))
    */
    id          int primary key not null,
    postal_code varchar(5)      not null,
    street      varchar(255)    not null,
    city_id     int             not null,
    state       varchar(100),
    foreign key (city_id) references cities (id)
);

insert into addresses (id, postal_code, street, city_id)
values (1, '12345', '123 Main St', 1),
       (2, '54321', '543 Elm St', 2),
       (3, '67890', '678 Oak St', 3),
       (4, '09876', '098 Pine St', 4),
       (5, '13579', '135 Maple St', 5);