-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
insert into Orders (CustomerID, Date) values (1, CURRENT_DATE); 
SET @order_id = LAST_INSERT_ID();
insert into OrderItems (OrderID, ProductID, Count) values (@order_id, 1, 1);
update Products set WarehouseAmount = WarehouseAmount - 1 where WarehouseAmount >= 1 and ID = 1;

COMMIT; 