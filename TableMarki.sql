drop table if exists Marki;
create table if not exists Marki
(
    /*
    Marki (Brands):
    BrandID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    CountryID (INT, FOREIGN KEY REFERENCES Countries(CountryID), NOT NULL)
    */

    id      int primary key auto_increment not null unique,
    name    varchar(30)                    not null unique,
    country int                            not null,
    foreign key (country) references kraje (id)
)