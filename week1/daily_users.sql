-- Goal: creat table that can show the new added user count, deleted user count, merged user count, and net added user count per day

SELECT 
  created.day, 
  created.user_added,
  COALESCE(deleted.user_deleted, 0) AS user_deleted,
  COALESCE(merged.user_merged, 0) AS user_merged,
  (created.user_added -  COALESCE(deleted.user_deleted, 0) - COALESCE(merged.user_merged, 0)) AS net_added_user
FROM
  (SELECT
    date(created_at) as day,
    COUNT(id) as user_added
  FROM
    dsv1069.users
  GROUP BY day) created
LEFT JOIN
  (SELECT
    date(deleted_at) as day,
    COUNT(id) as user_deleted
  FROM
    dsv1069.users
  GROUP BY day) deleted
ON created.day = deleted.day
LEFT JOIN
  (SELECT
    date(merged_at) as day,
    COUNT(id) as user_merged
  FROM
    dsv1069.users
  WHERE
    id <> parent_user_id
  AND  
    parent_user_id IS NOT NULL
  GROUP BY day) merged
ON created.day = merged.day;
