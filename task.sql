-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
insert into Orders (CustomerID, Date) values (LAST_INSERT_ID(), CURRENT_DATE); 
insert into OrderItems (OrderID, ProductID, Count) values (LAST_INSERT_ID(), 1, 1);
update Products set WarehouseAmount = WarehouseAmount - 1 where WarehouseAmount >= 1 and ID = 1;

COMMIT; 