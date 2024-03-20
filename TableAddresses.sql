create table Addresses
(
    /*
Address (Address):
AddressID (INT PRIMARY KEY NOT NULL)
PostalCode (VARCHAR(20) NOT NULL)
Street (VARCHAR(255) NOT NULL)
CityID (INT, FOREIGN KEY REFERENCES Cities(CityID), NOT NULL)
State (VARCHAR(100))
    */
    AddressID  int primary key not null auto_increment,
    PostalCode varchar(20)     not null,
    Street     varchar(255)    not null,
    CityID     int             not null,
    State      varchar(100),
    foreign key (CityID) references cities (CityID)
)