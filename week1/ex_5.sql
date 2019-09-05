-- GOAL: Compute the numbr of items which have been ordered

SELECT COUNT(DISTINCT orders.item_id) AS item_count
FROM dsv1069.orders
JOIN dsv1069.items
  ON items.id = orders.item_id;