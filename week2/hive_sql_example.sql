-- create table with date as partition

CREATE TABLE item_orders (
	id               BIGINT,
	item_name        STRING,
	Order_count      BIGINT)
PARTITION BY (
	date             DATE)


-- insert new information into item_orders
INSERT INTO TABLE
    item_orders
(PARTITION date)
SELECT
	id         
	item_name  
	Order_count
    date
FROM ...

