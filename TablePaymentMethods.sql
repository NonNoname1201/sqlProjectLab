create table payment_methods
(
    /*
        PaymentMethods (PaymentMethods):
        PaymentMethodID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        Name (VARCHAR, NOT NULL, UNIQUE)
        Description (TEXT, NOT NULL)
    */
    id          int primary key auto_increment not null unique,
    name        varchar(255)                   not null unique,
    description text                           not null
);

insert into positions (name, description) values
('Przelew', 'Przelew bankowy'),
('Visa', 'Płatność kartą'),
('Master Card', 'Płatność kartą'),
('Gotówka', 'Płatność gotówką'),
('BLIK', 'Płatność BLIK');