-- Write your PostgreSQL query statement below



SELECT 
    distinct p.product_id,
    COALESCE(latest.new_price, 10) AS price
FROM 
    Products p
LEFT JOIN (
    SELECT DISTINCT ON (product_id)
        product_id,
        new_price,
        change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    ORDER BY product_id, change_date DESC
) AS latest
ON p.product_id = latest.product_id
order by price;