create table users
(
    /*
        Users (Users):
        UserID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        Username (VARCHAR, NOT NULL)
        Password (VARCHAR, NOT NULL)
        Email (VARCHAR, NOT NULL, UNIQUE)
        Phone (VARCHAR, UNIQUE)
        AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL, UNIQUE) 1:1 with Address
        Role (ENUM('admin', 'user'), NOT NULL)
    */
    id          int auto_increment primary key  not null unique,
    username    varchar(30)                     not null unique,
    password    varchar(32)                     not null,
    email       varchar(45)                     not null unique,
    phone       varchar(15)                     unique,
    address_id  int                             not null unique,
    role        enum ('admin', 'user')          not null,
    foreign key (address_id) references addresses(id)
);

INSERT INTO users (username, password, email, phone, address_id, role)
VALUES  ('admin', 'admin123', 'admin@example.com', '123456789', 1, 'admin'),
        ('user1', 'password1', 'user1@example.com', '987654321', 2, 'user'),
        ('user2', 'password2', 'user2@example.com', NULL, 3, 'user'),
        ('user3', 'password3', 'user3@example.com', NULL, 4, 'user'),
        ('user4', 'password4', 'user4@example.com', '555555555', 5, 'user');