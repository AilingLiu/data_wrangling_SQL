-- GOAL: Figure out IF a user has ordered something, and when their first purchase was

SELECT 
  users.id AS user_id,
  MIN(paid_at) AS min_paid_at
FROM dsv1069.users
LEFT OUTER JOIN dsv1069.orders
  ON orders.user_id = users.id
GROUP BY users.id
--SELECT user_id,
--       MIN(paid_at)
--FROM dsv1069.orders AS orders
--GROUP BY user_id;