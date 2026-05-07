-- Write your PostgreSQL query statement below
WITH uniq_coords AS (
  SELECT *, 
    COUNT(*) OVER (PARTITION BY lat, lon) AS attempts,
    COUNT(*) OVER (PARTITION BY tiv_2015) AS tivs
  FROM Insurance
)
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM uniq_coords
WHERE attempts = 1 AND tivs > 1;