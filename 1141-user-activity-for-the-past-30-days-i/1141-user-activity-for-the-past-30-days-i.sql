-- Write your PostgreSQL query statement below
SELECT act.activity_date AS day, COUNT(DISTINCT act.user_id) AS active_users
FROM Activity AS act
WHERE act.activity_date 
BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY act.activity_date;