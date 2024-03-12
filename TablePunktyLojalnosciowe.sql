drop table if exists PunktyLojalnosciowe;
create table if not exists PunktyLojalnosciowe
(
    /*
    Punkty lojalnościowe (LoyaltyPoints):
    LoyaltyPointID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
    Points (INT, NOT NULL)
    ExpiryDate (DATE, NOT NULL)
    */

    id      int primary key auto_increment not null unique,
    customer_id       int                            not null,
    foreign key (customer_id) references klienci (id),
    points              int                         not null,
    expiry_date         date                        not null
)