-- Write your PostgreSQL query statement below
select * from Users
where mail ~ '^[A-Za-z][A-Za-z0-9._-]*@leetcode\.com$';
