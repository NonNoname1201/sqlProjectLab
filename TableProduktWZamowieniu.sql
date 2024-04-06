create table order_products
(
    /*
    OrderProducts (OrderProducts):
    OrderProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL) n:1 with Orders
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL) n:1 with Products
    Quantity (INT, NOT NULL)
    */

    id         int primary key auto_increment not null unique,
    order_id   int                            not null,
    foreign key (order_id) references orders (id),
    product_id int                            not null,
    foreign key (product_id) references products (id),
    quantity   int                            not null
)