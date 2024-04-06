create table transactions
(
    /*
        Transactions (Transactions):
        TransactionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
        OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), UNIQUE) 1:1 with Orders
        PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL) n:1 with PaymentMethods
        Amount (DECIMAL, NOT NULL)
        TransactionDate (DATETIME, NOT NULL)
    */

    transaction_id     INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    order_id           INT,
    payment_method_id  INT NOT NULL,
    amount             DECIMAL NOT NULL,
    transaction_date   DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id)
);

insert into transactions (order_id, payment_method_id, amount, transaction_date)
values  (1, 1, 120.50, '2024-04-01 10:30:00'),
        (2, 2, 89.99, '2024-04-02 15:45:00'),
        (3, 1, 349.99, '2024-04-03 12:00:00'),
        (4, 1, 91.99, '2024-04-02 16:45:00'),
        (5, 2, 15.99, '2024-08-021 11:44:00');
