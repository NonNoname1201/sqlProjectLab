/*

Countries (Countries):
CountryID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)

Cities (Cities):
CityID (INT, PRIMARY KEY, NOT NULL)
Name (VARCHAR, NOT NULL, UNIQUE)
CountryID (INT, FOREIGN KEY REFERENCES Countries(CountryID), NOT NULL)

Address (Address):
AddressID (INT PRIMARY KEY NOT NULL)
PostalCode (VARCHAR(5) NOT NULL)
Street (VARCHAR(255) NOT NULL)
CityID (INT, FOREIGN KEY REFERENCES Cities(CityID), NOT NULL)
State (VARCHAR(100))

Positions (Positions):
PositionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL, UNIQUE)
Description (TEXT, NOT NULL)

Employees (Employees):
EmployeeID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
FirstName (VARCHAR, NOT NULL)
LastName (VARCHAR, NOT NULL)
PositionID (INT, FOREIGN KEY REFERENCES Positions(PositionID), NOT NULL)
Email (VARCHAR, NOT NULL, UNIQUE)
Phone (VARCHAR, NOT NULL, UNIQUE)
HireDate (DATE, NOT NULL)
HourlyRate (DECIMAL, NOT NULL)

Customers (Customers):
CustomerID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
FirstName (VARCHAR, NOT NULL)
LastName (VARCHAR, NOT NULL)
Email (VARCHAR, UNIQUE)
Phone (VARCHAR, NOT NULL, UNIQUE)
AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL)

Stores (Stores):
StoreID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL)
AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL)
StoreManagerID (INT, FOREIGN KEY REFERENCES Employees(EmployeeID), NOT NULL)
State (enum('open', 'closed', 'under construction'), NOT NULL)

Categories (Categories):
CategoryID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL, UNIQUE)
ParentCategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))

Brands (Brands):
BrandID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL, UNIQUE)
Description (TEXT, NOT NULL)
AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL)

Products (Products):
ProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL)
BrandID (INT, FOREIGN KEY REFERENCES Brands(BrandID), NOT NULL)
CategoryID (INT, FOREIGN KEY REFERENCES Categories(CategoryID))
Description (TEXT, NOT NULL)
Price (DECIMAL, NOT NULL)

ProductInStock (ProductInStock):
ProductInStockID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
StoreID (INT, FOREIGN KEY REFERENCES Stores(StoreID), NOT NULL)
Quantity (INT, NOT NULL)

Users (Users):
UserID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Username (VARCHAR, NOT NULL)
Password (VARCHAR, NOT NULL)
Email (VARCHAR, NOT NULL, UNIQUE)
Phone (VARCHAR, UNIQUE)
AddressID (INT, FOREIGN KEY REFERENCES Address(AddressID), NOT NULL)
Role (ENUM('admin', 'user'), NOT NULL)

Cart (Cart):
CartID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
UserID (INT, FOREIGN KEY REFERENCES Users(UserID), NOT NULL)

CartProduct (CartProduct):
CartProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CartID (INT, FOREIGN KEY REFERENCES Cart(CartID), NOT NULL)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
Quantity (INT, NOT NULL)

Orders (Orders):
OrderID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
UserID (INT, FOREIGN KEY REFERENCES Users(UserID), NOT NULL)
OrderDate (DATETIME, NOT NULL)
ShipDate (DATETIME)
Status (ENUM('pending', 'shipping', 'delivered'), NOT NULL)

OrderProducts (OrderProducts):
OrderProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), NOT NULL)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
Quantity (INT, NOT NULL)

PaymentMethods (PaymentMethods):
PaymentMethodID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
Name (VARCHAR, NOT NULL, UNIQUE)
Description (TEXT, NOT NULL)

Transactions (Transactions):
TransactionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
OrderID (INT, FOREIGN KEY REFERENCES Orders(OrderID), UNIQUE)
PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL)
Amount (DECIMAL, NOT NULL)
TransactionDate (DATETIME, NOT NULL)

Checkouts (Checkouts):
CheckoutID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CustomerID (INT, FOREIGN KEY REFERENCES Customers(CustomerID), NOT NULL)
PaymentMethodID (INT, FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID), NOT NULL)
TotalAmount (DECIMAL, NOT NULL)
CheckoutDate (DATETIME, NOT NULL)

CheckoutProducts (CheckoutProducts):
CheckoutProductID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
CheckoutID (INT, FOREIGN KEY REFERENCES Checkouts(CheckoutID), NOT NULL)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
Quantity (INT, NOT NULL)

Promotions (Promotions):
PromotionID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
Discount (DECIMAL, NOT NULL)
StartDate (DATE, NOT NULL)
EndDate (DATE)

ProductRating (ProductRating):
ProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
UserID (INT, FOREIGN KEY REFERENCES Users(UserID), NOT NULL)
Rating (DECIMAL, NOT NULL)
Description (TEXT)

TotalProductRating (TotalProductRating):
TotalProductRatingID (INT, PRIMARY KEY, NOT NULL, UNIQUE)
ProductID (INT, FOREIGN KEY REFERENCES Products(ProductID), NOT NULL)
TotalRating (DECIMAL, NOT NULL)
TotalVotes (INT, NOT NULL)

Total - 23 tables
*/