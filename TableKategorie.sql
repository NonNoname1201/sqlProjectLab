drop table if exists Kategorie;
create table if not exists Kategorie
(
    /*
    Kategorie (Categories):
    CategoryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    ParentCategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
    */

    id               int primary key auto_increment not null unique,
    name             VARCHAR(30)                    not null,
    parentCategoryID int,
    foreign key (parentCategoryID) references
        kategorie (id)
)