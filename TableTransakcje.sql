drop table if exists Transakcje;
create table if not exists Transakcje
(
    /*
    Transakcje (Transactions):
    TransactionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL, UNIQUE)
    PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL)
    Amount (DECIMAL, NOT NULL)
    TransactionDate (DATETIME, NOT NULL)
    */

    id               int primary key auto_increment not null unique,
    order_id         int                            not null,
    foreign key (order_id) references zamowienia (id),
    paymentMethod_id int                            not null,
    foreign key (paymentMethod_id) references metodyplatnosci (id),
    amount           decimal(10, 2)                 not null,
    transaction_date DATETIME                       not null
)