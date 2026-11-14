select * from cape_codd.BUYER;
select * from cape_codd.INVENTORY;
select * from cape_codd.ORDER_ITEM;

-- Question 2.17
select SKU, SKU_Description from cape_codd.INVENTORY;

-- Question 2.18
select SKU_Description, SKU from cape_codd.INVENTORY;

-- 2.19
select WarehouseID from cape_codd.INVENTORY;

-- 2.20
select DISTINCT WarehouseID from cape_codd.INVENTORY;

-- 2.21
select WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder from cape_codd.INVENTORY;

-- 2.22
select * from cape_codd.INVENTORY;

-- 2.23
select * from cape_codd.INVENTORY
where QuantityOnHand > 0;

-- 2.24
select SKU, SKU_Description from cape_codd.INVENTORY
where QuantityOnHand = 0;

-- 2.25
select SKU, SKU_Description, WarehouseID from cape_codd.INVENTORY
where QuantityOnHand = 0
order by WarehouseID asc;

-- 2.26
select SKU, SKU_Description, WarehouseID from cape_codd.INVENTORY
where QuantityOnHand = 0
order by WarehouseID desc, SKU asc;

-- 2.27
select SKU, SKU_Description, WarehouseID from cape_codd.INVENTORY
where QuantityOnHand = 0 and QuantityOnOrder > 0
order by WarehouseID desc, SKU asc;

-- 2.28
select SKU, SKU_Description, WarehouseID from cape_codd.INVENTORY
where QuantityOnHand = 0 or QuantityOnOrder = 0
order by WarehouseID desc, SKU asc;

-- 2.29
select SKU, SKU_Description, WarehouseID, QuantityOnHand from cape_codd.INVENTORY
where QuantityOnHand > 1 and QuantityOnHand < 10;

-- 2.30
select SKU, SKU_Description, WarehouseID, QuantityOnHand from cape_codd.INVENTORY
where QuantityOnHand between 2 and 9;

-- 2.31
select distinct SKU, SKU_Description from cape_codd.INVENTORY
where SKU_Description like '%Half-Dome%' ;

-- 2.32
select distinct SKU, SKU_Description from cape_codd.INVENTORY
where SKU_Description like '%Climb%';

-- 2.33
select distinct SKU, SKU_Description from cape_codd.INVENTORY
where SKU_Description like '__d%';

-- 2.34
SELECT 
    count(QuantityOnHand) as Total_Items,
    sum(QuantityOnHand) as Total_Quantity_On_Hand,
    avg(QuantityOnHand) as Average_Quantity_On_Hand,
    min(QuantityOnHand) as Minimum_Quantity_On_Hand,
    max(QuantityOnHand) as Maximum_Quantity_On_Hand
FROM cape_codd.INVENTORY;

-- 2.36
select WarehouseID, sum(QuantityOnHand) as Total_Items_On_Hand
from cape_codd.INVENTORY
group by WarehouseID
order by Total_Items_On_Hand desc;

-- 2.37
select WarehouseID, sum(QuantityOnHand) as Total_Items_On_Hand_LT3
from cape_codd.INVENTORY
where QuantityOnHand < 3
group by WarehouseID
order by Total_Items_On_Hand_LT3 desc;

-- 2.38
select WarehouseID, sum(QuantityOnHand) as Total_Items_On_Hand_LT3
from cape_codd.INVENTORY
where QuantityOnHand < 3
group by WarehouseID
Having Count(*) < 2
order by Total_Items_On_Hand_LT3 desc;

