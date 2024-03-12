drop table if exists ProduktWZamowieniu;
create table if not exists ProduktWZamowieniu
(
    /*
    Produkt w zamówieniu (OrderProducts):
    OrderProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
    Quantity (INT, NOT NULL)
    Price (DECIMAL, NOT NULL)
    */

    id      int primary key auto_increment not null unique,
    order_id       int                            not null,
    foreign key (order_id) references zamowienia (id),
    product_id       int                            not null,
    foreign key (product_id) references produkty (id),
    quantity       int                            not null,
    price              decimal(10,2)              not null
)