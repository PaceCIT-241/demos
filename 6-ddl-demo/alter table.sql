USE Inventory;

ALTER TABLE Products
ADD Price DECIMAL(10, 2) NOT NULL DEFAULT 1.00;