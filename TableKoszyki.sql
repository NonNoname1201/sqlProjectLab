drop table if exists Koszyki;
create table if not exists Koszyki
(
    /*
    Koszyk (Cart):
    CartID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL, UNIQUE)
    TotalQuantity (INT, NOT NULL)
    */

    id       int primary key auto_increment not null unique,
    customer_id int                        not null,
    foreign key (customer_id) references klienci (id),
    quantity int                            not null
)