create table checkout_products
(
    /*
    CheckoutProducts (CheckoutProducts):
    CheckoutProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CheckoutID (INT, FOREIGN KEY REFERENCES Checkouts(CheckoutID), NOT NULL) n:1 with Checkouts
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL) n:1 with Products
    Quantity (INT, NOT NULL)
    */
    id int primary key not null,
    checkout_id int not null,
    foreign key (checkout_id) references checkouts(id),
    product_id int not null,
    foreign key (product_id) references products(id),
    quantity int not null
);

insert into checkout_products (id, checkout_id, product_id, quantity) values
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 1),
(4, 2, 3, 1),
(5, 3, 2, 1),
(6, 3, 3, 1);