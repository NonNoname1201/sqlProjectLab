create table stores
(
    /*
    Stores (Stores):
    StoreID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL)
    AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL, UNIQUE) 1:1 with Address
    StoreManagerID (INT, FOREIGN KEY REFERENCES Employees(EmployeeID), NOT NULL, UNIQUE) 1:1 with Employees
    State (enum('open', 'closed', 'under construction'), NOT NULL)
    */
    id      int primary key auto_increment not null unique,
    name    varchar(30)                    not null,
    address_id varchar(255)                not null unique,
    store_manager_id    INT                not null,
    state   ENUM('open', 'closed', 'under construction') not null
);

insert into stores (name, address_id, store_manager_id, state)
values  ('Gadget Gallery', '1', 101, 'open'),
        ('Tech Haven', '2', 102, 'closed'),
        ('Wired World', '3', 103, 'open'),
        ('Electric Empire', '4', 104, 'under construction'),
        ('Volt Valley', '5', 105, 'open');
