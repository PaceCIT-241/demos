CREATE DATABASE Inventory;

CREATE TABLE Products (
    ProductCode VARCHAR(10) NOT NULL PRIMARY KEY,
    Description VARCHAR(500)
);

CREATE TABLE ProductInventory (
    ProductCode VARCHAR(10) NOT NULL,
    LotNum int,
    Manufacturer VARCHAR(200),
    Quantity int NOT NULL,
    PRIMARY KEY (ProductCode, LotNum),
    FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

use INVENTORY;

CREATE TABLE Test (
    TestID INT AUTO_INCREMENT PRIMARY KEY,
    TestDesc VARCHAR(500)
);