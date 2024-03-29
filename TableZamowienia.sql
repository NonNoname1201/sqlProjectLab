drop table if exists Zamowienia;
create table if not exists Zamowienia
(
    /*
    Zamówienia (Orders):
    OrderID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
    StoreID (INT, FOREIGN KEY REFERENCES Stores(StoreID), NOT NULL)
    OrderDate (DATETIME, NOT NULL)
    ShipDate (DATETIME)
    Status (ENUM('pending', 'shipping', 'delivered'), NOT NULL)
    TotalAmount (DECIMAL, NOT NULL)
    */

    id      int primary key auto_increment not null unique,
    customer_id       int                            not null,
    foreign key (customer_id) references klienci (id),
    store_id       int                            not null,
    foreign key (store_id) references sklepy (id),
    orderDate       DATETIME                            not null,
    shipDate        DATETIME,
    status          ENUM('pending', 'shipping', 'delivered')    not null,
    totalAmount     DECIMAL(38,3)                       not null
)