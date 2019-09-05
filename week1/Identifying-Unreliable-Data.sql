-- GOAL: imagine that you need to count item views by day. You found this table_views_by_category_temp. Should you use it to answer your question?
 --SELECT *
--FROM dsv1069.item_views_by_category_temp
 -- the above returned table did not answer the question

SELECT 
  date(event_time) AS event_date,
  event_name,
  COUNT(*) AS count
FROM dsv1069.events_ex2
GROUP BY event_date, event_name;