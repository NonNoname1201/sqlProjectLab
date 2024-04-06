create table orders
(
    /*
        Orders (Orders):
        OrderID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        UserID (INT, FOREIGN KEY REFERENCES Users(UserID), NOT NULL) n:1 with Users
        OrderDate (DATETIME, NOT NULL)
        ShipDate (DATETIME)
        Status (ENUM('pending', 'shipping', 'delivered'), NOT NULL)
    */

    order_id   int primary key auto_increment not null unique,
    user_id    int                              not null,
    order_date datetime                         not null,
    ship_date  datetime,
    status     enum('pending', 'shipping', 'delivered') not null,
    foreign key (user_id) references TableUsers (user_id)
);

insert into orders (user_id, order_date, ship_date, status)
values  (1, '2024-04-01 10:00:00', '2024-04-02 14:00:00', 'delivered'),
        (2, '2024-04-02 09:30:00', '2024-04-03 11:45:00', 'shipping'),
        (3, '2024-04-03 12:20:00', null, 'pending'),
        (4, '2024-04-04 15:30:00', null, 'pending'),
        (5, '2024-04-05 11:45:00', null, 'pending');
