drop table if exists Produkty;
create table if not exists Produkty
(
    /*
    Produkty (Products):
    ProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL)
    BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID), NOT NULL)
    CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
    Description (TEXT, NOT NULL)
    Price (DECIMAL, NOT NULL)
    StockQuantity (INT, NOT NULL)
    Warranty (VARCHAR)
    */

    id             int primary key auto_increment not null unique,
    name           varchar(30)                    not null,
    brand_id       int                            not null,
    foreign key (brand_id) references marki (id),
    category_id    int,
    foreign key (category_id) references kategorie (id),
    description    text                           not null,
    price          decimal(10, 2)                 not null,
    stock_quantity int                            not null,
    warranty       varchar(300)                   not null
)