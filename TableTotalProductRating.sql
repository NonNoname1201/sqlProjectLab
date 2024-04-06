create table total_product_rating
(
    /*
        TotalProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL, UNIQUE) 1:1 with Products
        TotalRating (DECIMAL, NOT NULL)
        TotalVotes (INT, NOT NULL)
     */
    id           int primary key not null unique,
    product_id   int             not null unique,
    total_rating decimal(5, 1)   not null,
    total_votes  int             not null,
    foreign key (product_id) references products (id)
);

insert into total_product_rating (id, product_id, total_rating, total_votes) values
(1, 1, 0.0, 0),
(2, 2, 0.0, 0),
(3, 3, 0.0, 0),
(4, 4, 0.0, 0),
(5, 5, 0.0, 0);

