-- Write your PostgreSQL query statement below
SELECT t.id
FROM Weather y
CROSS JOIN Weather t
WHERE t.recordDate - y.recordDate = 1
    AND t.temperature > y.temperature;
    
