-- How many orders are placed each day and in rolling 7 days

SELECT 
  dates_rollup.date,
  COALESCE(SUM(daily.num_orders), 0) AS num_orders,
  COALESCE(SUM(daily.line_orders), 0) AS line_orders,
  COUNT(*) AS rows
  
FROM dsv1069.dates_rollup
LEFT OUTER JOIN
  (
  SELECT
    date(orders.paid_at)                        AS day,
    COUNT(DISTINCT orders.invoice_id)           AS num_orders,
    COUNT(DISTINCT orders.line_item_id)         AS line_orders
    --AVG(COUNT(orders.item_id)) OVER (ORDER BY date(orders.paid_at) ASC ROWS 6 PRECEDING) AS Roll7
  FROM
    dsv1069.orders
  GROUP BY
    date(orders.paid_at)
  ) daily
ON 
  dates_rollup.date = daily.day
AND
  dates_rollup.d7_ago < daily.day
GROUP BY
  dates_rollup.date

--SELECT * FROM dsv1069.orders LIMIT 10;