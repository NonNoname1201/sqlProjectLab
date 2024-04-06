create table checkouts
(
    /*
    Checkouts (Checkouts):
    CheckoutID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL) n:1 with Customers
    PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL) n:1 with PaymentMethods
    TotalAmount (DECIMAL, NOT NULL)
    CheckoutDate (DATETIME, NOT NULL)
    */
    id int primary key not null,
    customer_id int not null,
    foreign key (customer_id) references customers(id),
    payment_method_id int not null,
    foreign key (payment_method_id) references payment_methods(id),
    total_amount decimal not null,
    checkout_date datetime not null
);

insert into checkouts (id, customer_id, payment_method_id, total_amount, checkout_date)
values
(1, 1, 1, 100.00, '2021-01-01 00:00:00'),
(2, 2, 2, 200.00, '2021-01-02 00:00:00'),
(3, 3, 3, 300.00, '2021-01-03 00:00:00'),
(4, 4, 4, 400.00, '2021-01-04 00:00:00'),
(5, 5, 5, 500.00, '2021-01-05 00:00:00');