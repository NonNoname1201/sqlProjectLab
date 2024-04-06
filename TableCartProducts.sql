create table cart_products
(
    /*
    CartProduct (CartProduct):
    CartProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    UserID (INT, FOREIGN KEY REFERENCES Users(UserID), NOT NULL) n:1 with Users
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL) n:1 with Products
    Quantity (INT, NOT NULL)
    */
    id         int auto_increment primary key not null unique,
    user_id    int                            not null,
    foreign key (user_id) references users (id),
    product_id int                            not null,
    foreign key (product_id) references products (id),
    quantity   int                            not null

);

insert into cart_products (user_id, product_id, quantity)
values (1, 1, 1),
       (1, 2, 2),
       (2, 1, 3),
       (2, 2, 4);