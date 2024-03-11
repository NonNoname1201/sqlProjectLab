create table if not exists Koszyk
(
    /*
    Koszyk (Cart):
    CartID (INT, PRIMARY KEY)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID))
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID))
    Quantity (INT)
    */

    id       int primary key auto_increment not null unique,
    customer_id int                        not null,
    foreign key (customer_id) references klienci (id),
    product_id  int                        not null,
    foreign key (product_id) references  produkty (id),
    quantity int                            not null
)