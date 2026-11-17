--  select * from cape_codd.WAREHOUSE;
--  select distinct a.warehouseid from cape_codd.INVENTORY a;
--  select * from cape_codd.INVENTORY;

-- 2.40 --
select a.SKU, a.SKU_Description, a.WarehouseID, b.WarehouseCity, b.WarehouseState
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b on a.warehouseid = b.WarehouseID
where WarehouseCity = 'Atlanta'
or WarehouseCity = 'Bangor'
or WarehouseCity = 'Chicago';


-- 2.41 --
select a.SKU, a.SKU_Description, a.WarehouseID, b.WarehouseCity, b.WarehouseState
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b on a.warehouseid = b.WarehouseID
where WarehouseCity in ('Atlanta','Bangor','Chicago'); 
select * from cape_codd.INVENTORY;

-- 2.42 --
select a.SKU, a.SKU_Description, a.WarehouseID, b.WarehouseCity, b.WarehouseState
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b on a.warehouseid = b.WarehouseID
where WarehouseCity <> 'Atlanta'
or WarehouseCity <> 'Bangor'
or WarehouseCity <> 'Chicago'; 

-- 2.43 --
select a.SKU, a.SKU_Description, a.WarehouseID, b.WarehouseCity, b.WarehouseState
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b on a.warehouseid = b.WarehouseID
where WarehouseCity not in ('Atlanta','Bangor','Chicago'); 


-- 2.44 --
select CONCAT(a.SKU_Description, ' is located in ', b.WarehouseCity) ItemLocation
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b ON a.WarehouseID = b.WarehouseID;


-- 2.45 --
select SKU, SKU_Description, WarehouseID  
from cape_codd.INVENTORY 
where WarehouseID in(
	select WarehouseID 
	from cape_codd.WAREHOUSE
	where Manager = 'Lucille Smith');
    
    
-- 2.46 --
select  a.SKU, a.SKU_Description, a.WarehouseID
from cape_codd.INVENTORY a, cape_codd.WAREHOUSE b
where a.WarehouseID = b.WarehouseID
and b.Manager = 'Lucille Smith';   
  
  
-- 2.47 --  
select  a.SKU, a.SKU_Description, a.WarehouseID
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b
on a.WarehouseID = b.WarehouseID
where b.Manager = 'Lucille Smith';


-- 2.48 -- 
select WarehouseID, avg(QuantityOnHand) Average_Quantity_On_Hand  
from cape_codd.INVENTORY 
where WarehouseID in(
	select WarehouseID 
	from cape_codd.WAREHOUSE
	where Manager = 'Lucille Smith')
    group by WarehouseID;
  
  
 -- 2.49 --
select a.WarehouseID, avg(QuantityOnHand) Average_Quantity_On_Hand  
from cape_codd.INVENTORY a, cape_codd.WAREHOUSE b
where a.WarehouseID = b.WarehouseID
and b.Manager = 'Lucille Smith'
group by WarehouseID; 


-- 2.50 -- 
select a.WarehouseID, avg(QuantityOnHand) Average_Quantity_On_Hand 
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b
on a.WarehouseID = b.WarehouseID
where b.Manager = 'Lucille Smith'
group by WarehouseID;


-- 2.51 --
select b.WarehouseID, b.WarehouseCity, b.WarehouseState, b.Manager, a.SKU, a.SKU_Description, a.QuantityOnHand
from cape_codd.INVENTORY a join cape_codd.WAREHOUSE b on a.WarehouseID = b.WarehouseID
where Manager = 'Lucille Smith';


-- 2.52 --
select WarehouseID, sum(QuantityOnOrder) TotalItemsOnOrder, sum(QuantityOnHand) TotalItemsOnHand
from cape_codd.INVENTORY
group by WarehouseID, QuantityOnOrder;


-- 2.55 --
select b.*, a.SKU, a.SKU_Description, a.QuantityOnHand, a.QuantityOnOrder
from cape_codd.WAREHOUSE b left join cape_codd.INVENTORY a on b.WarehouseID = a.WarehouseID;
