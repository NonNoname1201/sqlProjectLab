/*
Klienci (Customers):
CustomerID (INT, PRIMARY KEY)
FirstName (VARCHAR)
LastName (VARCHAR)
Email (VARCHAR)
Phone (VARCHAR)
Address (VARCHAR)
City (VARCHAR)

Pracownicy (Employees):
EmployeeID (INT, PRIMARY KEY)
FirstName (VARCHAR)
LastName (VARCHAR)
Position (VARCHAR)
Email (VARCHAR)
Phone (VARCHAR)
HireDate (DATE)
Salary (DECIMAL)

Sklepy (Stores):
StoreID (INT, PRIMARY KEY)
Name (VARCHAR)
Address (VARCHAR)
City (VARCHAR)
Country (VARCHAR)

Produkty (Products):
ProductID (INT, PRIMARY KEY)
Name (VARCHAR)
BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID))
CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
Description (TEXT)
Price (DECIMAL)
StockQuantity (INT)
Warranty (INT)


Kategorie (Categories):
CategoryID (INT, PRIMARY KEY)
Name (VARCHAR)
ParentCategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))

Użytkownicy (Users):
UserID (INT, PRIMARY KEY)
Username (VARCHAR)
Password (VARCHAR)
Role (ENUM('admin', 'user'))

Koszyk (Cart):
CartID (INT, PRIMARY KEY)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID))
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID))
Quantity (INT)

Zamówienia (Orders):
OrderID (INT, PRIMARY KEY)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID))
StoreID (INT, FOREIGN KEY REFERENCES Stores(StoreID))
OrderDate (DATETIME)
ShipDate (DATETIME)
Status (ENUM('pending', 'shipped', 'delivered'))
TotalAmount (DECIMAL)

Produkt w zamówieniu (OrderProducts):
OrderProductID (INT, PRIMARY KEY)
OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID))
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID))
Quantity (INT)
Price (DECIMAL)


Transakcje (Transactions):
TransactionID (INT, PRIMARY KEY)
OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID))
PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID))
Amount (DECIMAL)
TransactionDate (DATETIME)

Promocje (Promotions):
PromotionID (INT, PRIMARY KEY)
Name (VARCHAR)
Description (TEXT)
DiscountPercent (DECIMAL)
StartDate (DATE)
EndDate (DATE)

Marki (Brands):
BrandID (INT, PRIMARY KEY)
Name (VARCHAR)
Country (VARCHAR)

Punkty lojalnościowe (LoyaltyPoints):
LoyaltyPointID (INT, PRIMARY KEY)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID))
Points (INT)
ExpiryDate (DATE)

Oceny produktów (ProductRatings):
ProductRatingID (INT, PRIMARY KEY)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID))
AvgRating (DECIMAL)
NumRatings (INT)

*/