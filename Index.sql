create database inv;

use inv;

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    ContactPhone VARCHAR(15)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    ContactPhone VARCHAR(15)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityOnHand INT,
    ReorderLevel INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, ContactEmail, ContactPhone)
VALUES
(1, 'Supplier A', 'Alice', 'alice@example.com', '123-456-7890'),
(2, 'Supplier B', 'Bob', 'bob@example.com', '123-456-7891');

-- Insert sample data into Products
INSERT INTO Products (ProductID, ProductName, Category, Price, SupplierID)
VALUES
(1, 'Product 1', 'Category A', 10.00, 1),
(2, 'Product 2', 'Category B', 20.00, 2);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, CustomerName, ContactName, ContactEmail, ContactPhone)
VALUES
(1, 'Customer A', 'Carol', 'carol@example.com', '123-456-7892'),
(2, 'Customer B', 'Dave', 'dave@example.com', '123-456-7893');

-- Insert sample data into Orders
INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES
(1, '2023-07-01', 1),
(2, '2023-07-02', 2);

-- Insert sample data into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 2, 10.00),
(2, 2, 2, 1, 20.00);

-- Insert sample data into Inventory
INSERT INTO Inventory (InventoryID, ProductID, QuantityOnHand, ReorderLevel)
VALUES
(1, 1, 50, 10),
(2, 2, 30, 5);
