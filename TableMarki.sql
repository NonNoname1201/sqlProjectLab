create table if not exists Marki
(
    /*
    Marki (Brands):
    BrandID (INT, PRIMARY KEY)
    Name (VARCHAR)
    Country (VARCHAR)
    */
    id      int primary key auto_increment not null unique,
    name    varchar(255)                   not null unique,
    country varchar(255)                   not null
)