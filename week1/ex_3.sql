-- GOAL: JOIN the users table to the orders table
SELECT *
FROM dsv1069.orders
JOIN dsv1069.users
ON orders.user_id = users.id;