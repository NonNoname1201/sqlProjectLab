create table product_in_stock
(
   /*
    ProductInStock (ProductInStock):
    ProductInStockID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL) n:1 with Products
    StoreID (INT, FOREIGN KEY REFERENCES Stores(StoreID), NOT NULL) n:1 with Stores
    Quantity (INT, NOT NULL)
    */

    id INT PRIMARY KEY NOT NULL UNIQUE,
    product_id        INT NOT NULL,
    store_id          INT NOT NULL,
    quantity         INT NOT NULL,
    foreign key (product_id ) references products(id),
    foreign key (store_id) references stores(id)
);

INSERT INTO product_in_stock (id, product_id, store_id, quantity)
VALUES  (1, 1, 1, 50),
        (2, 2, 2, 30),
        (3, 3, 3, 20),
        (4, 4, 4, 15),
        (5, 5, 5, 10);

