/*
    Klienci (Customers):
    CustomerID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    FirstName (VARCHAR, NOT NULL)
    LastName (VARCHAR, NOT NULL)
    Email (VARCHAR, NOT NULL, UNIQUE)
    Phone (VARCHAR, NOT NULL, UNIQUE)
    Address (VARCHAR, NOT NULL)
    City (VARCHAR, NOT NULL)
      */
insert into klienci (id, first_name, last_name, email, phone, address, city)
values (1, 'Jan', 'Kowalski', 'temp@temp.com', '123456789', 'ul. Kowalskiego 1', 'Warszawa');
insert into klienci (id, first_name, last_name, email, phone, address, city)
values (2, 'Anna', 'Nowak', 'temp2@temp.com', '987654321', 'ul. Nowaka 2', 'Kraków');

/*
    Pracownicy (Employees):
    EmployeeID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    FirstName (VARCHAR, NOT NULL)
    LastName (VARCHAR, NOT NULL)
    Position (VARCHAR, NOT NULL)
    Email (VARCHAR, NOT NULL, UNIQUE)
    Phone (VARCHAR, NOT NULL, UNIQUE)
    HireDate (DATE, NOT NULL)
    HourlyRate (DECIMAL, NOT NULL)
    */
insert into pracownicy (id, first_name, fast_name, position, email, phone, hire_date, hourly_rate)
values (1, 'Jan', 'Kowalski', 'Sprzedawca', 'temp3@temp.com', '123456789', '2020-01-01', 10.0);

/*
    Sklepy (Stores):
    StoreID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL)
    Address (VARCHAR, NOT NULL, UNIQUE)
    City (VARCHAR, NOT NULL)
    Country (VARCHAR, NOT NULL)
    */
insert into sklepy (id, name, address, city, country)
values (1, 'Sklep1', 'ul. Sklepowa 1', 'Warszawa', 'Polska');

/*
    Kategorie (Categories):
    CategoryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    ParentCategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
    */
insert into kategorie (id, name, parentCategoryID)
values (1, 'Kategoria1', NULL);
insert into kategorie (id, name, parentCategoryID)
values (2, 'Kategoria2', NULL);
insert into kategorie (id, name, parentCategoryID)
values (3, 'Kategoria3', 1);

/*
    Kraje (Countries):
    CountryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    */
insert into kraje (id, name)
values (1, 'Polska');
insert into kraje (id, name)
values (2, 'Niemcy');
insert into kraje (id, name)
values (3, 'Francja');

/*
    Marki (Brands):
    BrandID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    CountryID (INT, FOREIGN KEY REFERENCES Countries(CountryID), NOT NULL)
    */
insert into marki (id, name, country)
values (1, 'Marka1', 1);
insert into marki (id, name, country)
values (2, 'Marka2', 2);

/*
    Produkty (Products):
    ProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL)
    BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID), NOT NULL)
    CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
    Description (TEXT, NOT NULL)
    Price (DECIMAL, NOT NULL)
    StockQuantity (INT, NOT NULL)
    Warranty (VARCHAR)
    */
insert into produkty (id, name, brand_id, category_id, description, price, stock_quantity, warranty)
values (1, 'Produkt1', 1, 1, 'Opis1', 100.0, 10, '12 miesięcy');
insert into produkty (id, name, brand_id, category_id, description, price, stock_quantity, warranty)
values (2, 'Produkt2', 2, 2, 'Opis2', 200.0, 20, '24 miesięcy');
insert into produkty (id, name, brand_id, category_id, description, price, stock_quantity, warranty)
values (3, 'Produkt3', 1, 3, 'Opis3', 300.0, 30, '36 miesięcy');

/*
    Użytkownicy (Users):
    UserID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), UNIQUE)
    EmployeeID (INT, FOREIGN KEY REFERENCES Employees(EmployeeID), UNIQUE)
    Username (VARCHAR, NOT NULL)
    Password (VARCHAR, NOT NULL)
    Role (ENUM('admin', 'user'), NOT NULL)
    */
insert into uzytkownicy (id, customer_id, employee_id, username, password, role)
values (1, 1, NULL, 'user1', 'password1', 'user');
insert into uzytkownicy (id, customer_id, employee_id, username, password, role)
values (2, NULL, 1, 'user2', 'password2', 'user');

/*
    Koszyk (Cart):
    CartID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL, UNIQUE)
    TotalQuantity (INT, NOT NULL)
    */
insert into koszyki (id, customer_id, quantity)
values (1, 1, 0);

/*
    Produkt w koszyku (OrderProducts):
    CartProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CartID (INT, FOREIGN KEY REFERENCES Carts(CartID), NOT NULL)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
    Quantity (INT, NOT NULL)
    Price (DECIMAL, NOT NULL)
    */
insert into productwkoszyku (id, cart_id, product_id, quantity, price)
values (1, 1, 1, 1, 100.0);
insert into productwkoszyku (id, cart_id, product_id, quantity, price)
values (2, 1, 2, 2, 200.0);
insert into productwkoszyku (id, cart_id, product_id, quantity, price)
values (3, 1, 3, 3, 300.0);

/*
    Zamówienia (Orders):
    OrderID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
    StoreID (INT, FOREIGN KEY REFERENCES Stores(StoreID), NOT NULL)
    OrderDate (DATETIME, NOT NULL)
    ShipDate (DATETIME)
    Status (ENUM('pending', 'shipping', 'delivered'), NOT NULL)
    TotalAmount (DECIMAL, NOT NULL)
    */
insert into zamowienia (id, customer_id, store_id, orderDate, shipDate, status, totalAmount)
values (1, 1, 1, '2020-01-01', '2020-01-02', 'delivered', 1000.0);
insert into zamowienia (id, customer_id, store_id, orderDate, shipDate, status, totalAmount)
values (2, 1, 1, '2020-01-03', '2020-01-04', 'delivered', 2000.0);

/*
    Produkt w zamówieniu (OrderProducts):
    OrderProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
    Quantity (INT, NOT NULL)
    Price (DECIMAL, NOT NULL)
    */
insert into produktwzamowieniu (id, order_id, product_id, quantity, price)
values (1, 1, 1, 1, 100.0);
insert into produktwzamowieniu (id, order_id, product_id, quantity, price)
values (2, 1, 2, 2, 200.0);

/*
    13. Metody płatności (PaymentMethods):
    PaymentMethodID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    Name (VARCHAR, NOT NULL, UNIQUE)
    Description (TEXT, NOT NULL)
    */
insert into metodyplatnosci (id, name, description)
values (1, 'MasterCard', 'Opis1');
insert into metodyplatnosci (id, name, description)
values (2, 'Visa', 'Opis2');

/*
    Transakcje (Transactions):
    TransactionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL, UNIQUE)
    PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL)
    Amount (DECIMAL, NOT NULL)
    TransactionDate (DATETIME, NOT NULL)
    */
insert into transakcje (id, order_id, paymentMethod_id, amount, transaction_date)
values (1, 1, 1, 1000.0, '2020-01-01');
insert into transakcje (id, order_id, paymentMethod_id, amount, transaction_date)
values (2, 2, 2, 2000.0, '2020-01-03');

/*
    Punkty lojalnościowe (LoyaltyPoints):
    LoyaltyPointID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
    Points (INT, NOT NULL)
    ExpiryDate (DATE, NOT NULL)
    */
insert into punktylojalnosciowe (id, customer_id, points, expiry_date)
values (1, 1, 100, '2021-01-01');
insert into punktylojalnosciowe (id, customer_id, points, expiry_date)
values (2, 1, 200, '2022-01-01');

/*
    Ocena produktu (ProductRating):
    ProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
    ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
    ClientID (INT,  FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
    Rating (DECIMAL)
    Description (VARCHAR, NOT NULL)
    */
insert into ocenaproduktu (id, product_id, client_id, rating, description)
values (1, 1, 1, 5.0, 'Opis1');
insert into ocenaproduktu (id, product_id, client_id, rating, description)
values (2, 2, 1, 4.0, 'Opis2');
