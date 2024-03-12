drop table if exists OcenaProduktu;
create table if not exists OcenaProduktu
(
    /*
    Ocena produktu (ProductRating):
    ProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
    ClientID (INT,  FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
    Rating (DECIMAL)
    Description (VARCHAR, NOT NULL)
    */

    id          int primary key auto_increment not null unique,
    product_id  int                            not null,
    foreign key (product_id) references produkty (id),
    client_id   int,
    foreign key (client_id) references klienci (id),
    rating      decimal(10, 2),
    description text                           not null
)