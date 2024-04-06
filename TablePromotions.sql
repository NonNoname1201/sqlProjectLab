create table promotions
(
    /*
    Promotions (Promotions):
    PromotionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL, UNIQUE) 1:1 with Products
    Discount (DECIMAL, NOT NULL)
    StartDate (DATE, NOT NULL)
    EndDate (DATE)
     */

    id                  int primary key auto_increment not null unique,
    product_id          int                             not null unique,
    discount            decimal(10, 2)                  not null,
    start_date          date                            not null,
    end_date            date,
    foreign key (product_id ) references TableProducts(product_id)
);

insert into  promotions (product_id, discount, start_date, end_date)
values
    (1, 0.1, '2024-04-01', '2024-04-15'),
    (2, 0.15, '2024-04-10', '2024-04-30'),
    (3, 0.2, '2024-04-05', '2024-04-20'),
    (4, 0.12, '2024-04-03', '2024-04-18'),
    (5, 0.25, '2024-04-12', '2024-04-25');