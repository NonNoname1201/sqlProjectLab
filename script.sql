/*
1. Klienci (Customers):
CustomerID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
FirstName (VARCHAR, NOT NULL)
LastName (VARCHAR, NOT NULL)
Email (VARCHAR, NOT NULL, UNIQUE)
Phone (VARCHAR, NOT NULL, UNIQUE)
Address (VARCHAR, NOT NULL)
City (VARCHAR, NOT NULL)

2. Pracownicy (Employees):
EmployeeID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
FirstName (VARCHAR, NOT NULL)
LastName (VARCHAR, NOT NULL)
Position (VARCHAR, NOT NULL)
Email (VARCHAR, NOT NULL, UNIQUE)
Phone (VARCHAR, NOT NULL, UNIQUE)
HireDate (DATE, NOT NULL)
HourlyRate (DECIMAL, NOT NULL)

3. Sklepy (Stores):
StoreID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL)
Address (VARCHAR, NOT NULL, UNIQUE)
City (VARCHAR, NOT NULL)
Country (VARCHAR, NOT NULL)

4. Kategorie (Categories):
CategoryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL, UNIQUE)
ParentCategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))

5. Kraje (Countries):
CountryID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)

6. Marki (Brands):
BrandID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL, UNIQUE)
CountryID (INT, FOREIGN KEY REFERENCES Countries(CountryID), NOT NULL)

7. Produkty (Products):
ProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL)
BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID), NOT NULL)
CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
Description (TEXT, NOT NULL)
Price (DECIMAL, NOT NULL)
StockQuantity (INT, NOT NULL)
Warranty (VARCHAR)

8. Użytkownicy (Users):
UserID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), UNIQUE)
EmployeeID (INT, FOREIGN KEY REFERENCES Employees(EmployeeID), UNIQUE)
Username (VARCHAR, NOT NULL)
Password (VARCHAR, NOT NULL)
Role (ENUM('admin', 'user'), NOT NULL)

9. Koszyk (Cart):
CartID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL, UNIQUE)]
TotalQuantity (INT, NOT NULL)

10. Produkt w koszyku (OrderProducts):
CartProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CartID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
Quantity (INT, NOT NULL)
Price (DECIMAL, NOT NULL)

11. Zamówienia (Orders):
OrderID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
StoreID (INT, FOREIGN KEY REFERENCES Stores(StoreID), NOT NULL)
OrderDate (DATETIME, NOT NULL)
ShipDate (DATETIME)
Status (ENUM('pending', 'shipping', 'delivered'), NOT NULL)
TotalAmount (DECIMAL, NOT NULL)

12. Produkt w zamówieniu (OrderProducts):
OrderProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
Quantity (INT, NOT NULL)
Price (DECIMAL, NOT NULL)

13. Transakcje (Transactions):
TransactionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL, UNIQUE)
PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL)
Amount (DECIMAL, NOT NULL)
TransactionDate (DATETIME, NOT NULL)

-- Promocje (Promotions):
-- PromotionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
-- Name (VARCHAR, NOT NULL)
-- Description (TEXT, NOT NULL)
-- DiscountPercent (DECIMAL, NOT NULL)
-- StartDate (DATE, NOT NULL)
-- EndDate (DATE)

14. Punkty lojalnościowe (LoyaltyPoints):
LoyaltyPointID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
Points (INT, NOT NULL)
ExpiryDate (DATE, NOT NULL)

15. Ocena produktu (ProductRating):
ProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
ClientID (INT,  FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
Rating (DECIMAL)
Description (VARCHAR, NOT NULL)

Total - 15
*/