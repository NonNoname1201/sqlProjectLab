create table brands
(
    /*
    Brands (Brands):
    BrandID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    Description (TEXT, NOT NULL)
    AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL, UNIQUE) 1:1 with Address
    */

    id      int primary key auto_increment not null unique,
    name    varchar(30)                    not null unique,
    description text                            not null,
    address_id  INT,
    foreign key (address_id) references addresses (id)
);

insert into brands (name, description, address_id)
values  ('Samsung', 'Electronics and Appliances manufacturer', 1),
        ('Apple', 'Consumer Electronics and Technology company', 2),
        ('Philips', 'Diversified Electronics company', 3),
        ('Dell', 'Computer Technology Solutions provider', 4),
        ('LG', 'Global Technology and Home Appliances company', 5);



