-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
insert into Orders (CustomerID, Date) values (1, CURRENT_DATE); 

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
insert into OrderItems (OrderID, ProductID, Count) values (1, 1, 1);
update Products set WarehouseAmount= 41;

COMMIT; 