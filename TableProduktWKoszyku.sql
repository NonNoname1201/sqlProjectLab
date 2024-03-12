drop table if exists ProductWKoszyku;
create table ProductWKoszyku
(
    /*
    Produkt w koszyku (OrderProducts):
    CartProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CartID (INT, FOREIGN KEY REFERENCES Carts(CartID), NOT NULL)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
    Quantity (INT, NOT NULL)
    Price (DECIMAL, NOT NULL)
    */
    id         int auto_increment primary key not null unique,
    cart_id    int                            not null,
    foreign key (cart_id) references koszyki (id),
    product_id int                            not null,
    foreign key (product_id) references produkty (id),
    quantity   int                            not null,
    price      decimal                        not null
);