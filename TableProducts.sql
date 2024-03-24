create table products
(
    /*
        ProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        Name (VARCHAR, NOT NULL)
        BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID), NOT NULL, UNIQUE) 1:1 with Brands
        CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID), NOT NULL, UNIQUE) 1:1 with Categories
        Description (TEXT, NOT NULL)
        Price (DECIMAL, NOT NULL)
    */

    id             int primary key not null unique,
    name           varchar(30)                    not null,
    brand_id       int                            not null,
    category_id    int                            not null,
    description    text                           not null,
    price          decimal(10, 2)                 not null,
    foreign key (brand_id) references brands(id),
    foreign key (category_id) references categories(id)
);

INSERT INTO products (id, name, brand_id, category_id, description, price)
VALUES  (1, 'Galaxy S21', 1, 4, 'Flagship smartphone with advanced features', 899.99),
        (2, 'iPhone 13', 2, 4, 'Latest iPhone with powerful performance', 999.99),
        (3, 'Philips Hue Starter Kit', 3, 2, 'Smart lighting system for your home', 149.99),
        (4, 'Dell XPS 13', 4, 2, 'Thin and light laptop for productivity', 1199.99),
        (5, 'LG OLED C1 Series TV', 5, 3, 'Premium OLED TV with stunning picture quality', 1999.99);


