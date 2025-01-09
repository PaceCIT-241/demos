USE Inventory;

INSERT INTO Products (ProductCode, Description)
VALUES
('C470', 'really long wrench'),
('G32', 'claw hammer'),
('Y55', 'door handle'),
('3566','clamshell trim'),
('B20','paving stone'),
('GL55L', 'bracket');

INSERT INTO ProductInventory
VALUES
('C470',4,'WesternHardware',200),
('G32',17,'Hatsmanns',300),
('C470',1,'Jones Heeavy Duty',50),
('Y55',10,'WesternHardware',25);