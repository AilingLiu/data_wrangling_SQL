-- Q:'How many users are added each day?' (excluding the deleted or merged account)

SELECT 
  date(created_at) as created_date,
  COUNT(id) as user_created_count
FROM dsv1069.users
WHERE deleted_at ISNULL
AND (id <> parent_user_id OR parent_user_id ISNULL)
GROUP BY created_date;