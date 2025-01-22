-- Active: 1737479855987@@127.0.0.1@3306@school
USE inventory;
-- I want to know which manufacturers make claw hammers

-- I can work backward through the tables:
-- step 1
select ProductCode from Products where Description = 'claw hammer';
--product code is G32
-- step 2
select Manufacturer from ProductInventory where ProductCode = 'G32'

-- OR I can combine these two queries together using a subquery
select Manufacturer from ProductInventory where ProductCode = 
(select ProductCode from Products where Description = 'claw hammer');

-- but what if I want to get the price as well?
select ProductCode, Manufacturer, (select Price from Products where Description = 'claw hammer') as Price 
from ProductInventory where ProductCode = 
(select ProductCode from Products where Description = 'claw hammer')

-- this is another way

select table2.ProductCode, Manufacturer, Price from 
(select ProductCode, Price, Description from Products) table2, ProductInventory pi
where pi.ProductCode = table2.ProductCode and Description = 'claw hammer'

-- this works, but it's getting pretty complicated
-- I can use a join instead

select p.ProductCode, pi.Manufacturer, p.Price from ProductInventory pi 
join Products p on pi.ProductCode = p.ProductCode
where p.Description = 'claw hammer'

-- I want to get the description of every product I currently have in inventory
select Description from Products where ProductCode in 
(select ProductCode from ProductInventory where Quantity > 0)

-- or
select distinct Description from Products p join 
ProductInventory pi on p.ProductCode = pi.ProductCode
where pi.Quantity > 0

-- the products I DON'T have in inventory
select Description from Products where ProductCode not in 
(select ProductCode from ProductInventory where Quantity > 0)

select distinct Description from Products p join 
ProductInventory pi on p.ProductCode = pi.ProductCode
where pi.Quantity = 0 or pi.Quantity is null

use School

-- combining columns into one result
select CONCAT_WS(' ', FirstName, LastName) as FullName from Students

-- different kinds of join

select CONCAT_WS(' ', FirstName, LastName) as Name, OfficeNumber 
from Professors p join Offices o on p.OfficeID = o.OfficeId

select CONCAT_WS(' ', FirstName, LastName) as Name, OfficeNumber 
from Professors p left join Offices o on p.OfficeID = o.OfficeId

select CONCAT_WS(' ', FirstName, LastName) as Name, OfficeNumber 
from Professors p right join Offices o on p.OfficeID = o.OfficeId

select CONCAT_WS(' ', FirstName, LastName) as Name, OfficeNumber 
from Professors p left join Offices o on p.OfficeID = o.OfficeId
union
select CONCAT_WS(' ', FirstName, LastName) as Name, OfficeNumber 
from Professors p right join Offices o on p.OfficeID = o.OfficeId

use Inventory

-- using count to get the number of times a manufacturer appears in our inventory list

select count(Manufacturer) as NumProducts from ProductInventory 
where Manufacturer = 'WesternHardware'

-- details about price
select avg(price) as 'Average Price',
sum(price) as 'Total Price',
max(price) as 'Highest Price',
min(price) as 'Lowest Price'
from Products

-- using group by to get the number of times each manufacturer appears in our inventory list
select Manufacturer, count(Manufacturer) as NumProducts from ProductInventory
group by Manufacturer

-- using group by to get the highest price item for each manufacturer
select pi.Manufacturer, max(price) from Products p join ProductInventory pi
on p.ProductCode = pi.ProductCode
group by pi.Manufacturer

-- using group by with a summary function
select * from Products where Price > (select avg(price) from Products)

-- grouping products by manufacturer
select Manufacturer, count(Manufacturer) as NumProducts,
GROUP_CONCAT(p.Description) as ProductsList 
from ProductInventory pi
join Products p on p.ProductCode = pi.ProductCode
group by Manufacturer
order by NumProducts, Manufacturer