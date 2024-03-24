create table categories
(
    /*
        Categories (Categories):
        CategoryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        Name (VARCHAR, NOT NULL, UNIQUE)
        ParentCategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID)) n:1 with Categories
    */

    id                  int primary key auto_increment not null unique,
    name                VARCHAR(50)                    not null unique,
    parent_category_id  int,
    foreign key (parent_category_id) references categories (id)
);

insert into categories (name, parent_category_id)
values  ('Phones', null),
        ('Laptops', null),
        ('TV', null),
        ('Smartphones', 1),
        ('Button phones', 1);