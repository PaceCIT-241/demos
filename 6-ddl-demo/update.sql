USE Inventory;

--I misspelled the manufacturer on insert

UPDATE ProductInventory
SET Manufacturer = 'Jones Heavy Duty'
WHERE ProductCode = 'C470' AND
    LotNum = 1;