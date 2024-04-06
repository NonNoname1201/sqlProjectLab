create table product_rating

(
    /*
        ProductRating (ProductRating):
        ProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL) n:1 with Products
        UserID (INT, FOREIGN KEY REFERENCES Users(UserID), NOT NULL, UNIQUE) 1:1 with Users
        Rating (DECIMAL, NOT NULL)
        Description (TEXT)
    */

    id                  int primary key auto_increment not null unique,
    product_id          int                             not null,
    user_id             int                             not null unique,
    rating              decimal(3, 2)                   not null,
    description         text,
    foreign key (product_id) references products(id),
    foreign key (user_id) references users(id)
);

INSERT INTO product_rating (product_id, user_id, rating, description)
VALUES  (1, 2, 4.5, 'Great phone, very satisfied with the performance.'),
        (2, 3, 3.8, 'Good laptop, but the battery life could be better.'),
        (3, 4, 5.0, 'Excellent TV, amazing picture quality.'),
        (1, 5, 4.0, 'Decent phone for the price.'),
        (2, 1, 4.2, 'Solid performance, lightweight design.');