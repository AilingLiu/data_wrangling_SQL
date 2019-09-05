-- GOAL: Count the number of viewed_item_events

SELECT COUNT(DISTINCT event_id)
FROM dsv1069.events
WHERE event_name = 'view_item';