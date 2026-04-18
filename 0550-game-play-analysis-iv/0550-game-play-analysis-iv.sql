-- Write your PostgreSQL query statement below
WITH activity_ranked AS (
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rank,
LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) as next_date
FROM activity
)
SELECT ROUND(1.0 * COUNT(DISTINCT CASE WHEN next_date = event_date + INTERVAL '1 day'
THEN player_id END) /
COUNT(DISTINCT player_id),2) AS fraction
FROM activity_ranked
WHERE rank = 1;