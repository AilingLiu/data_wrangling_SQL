-- GOAL: Figure out what percent users have ever viewed the user profile page

SELECT (CASE
            WHEN first_view ISNULL THEN false
            ELSE true
        END) AS has_viewed_profile_page,
       COUNT(user_id) AS users
FROM
  (SELECT users.id AS user_id,
          MIN(event_time) AS first_view
   FROM dsv1069.users
   LEFT OUTER JOIN dsv1069.events
     ON events.user_id = users.id
   AND event_name = 'view_user_profile'
   GROUP BY users.id ) first_profile_views
GROUP BY has_viewed_profile_page;
--(CASE
--              WHEN first_view ISNULL THEN false
--              ELSE true
--          END);

