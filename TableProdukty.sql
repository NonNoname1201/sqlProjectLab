create table if not exists Produkty
(
    /*
    Produkty (Products):
    ProductID (INT, PRIMARY KEY)
    Name (VARCHAR)
    BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID))
    CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
    Description (TEXT)
    Price (DECIMAL)
    StockQuantity (INT)
    Warranty (INT)
    */

    id             int primary key auto_increment not null unique,
    name           varchar(30)                    not null,
    brand_id       int                            not null,
    foreign key (brand_id) references marki (id),
    category_id    int                            not null,
    foreign key (category_id) references kategorie (id),
    description    text,
    price          decimal(10, 2)                 not null,
    stock_quantity int                            not null,
    warranty       int                            not null
)