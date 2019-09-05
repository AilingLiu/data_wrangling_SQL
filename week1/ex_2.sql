-- GOAL: count the number of items for sale in each category
SELECT 
  category, 
  COUNT(*) as item_count
FROM dsv1069.items
GROUP BY category
ORDER BY 2 DESC;