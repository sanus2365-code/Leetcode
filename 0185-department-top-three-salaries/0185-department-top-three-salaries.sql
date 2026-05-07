-- Write your PostgreSQL query statement below
with ranked_salaries as (
    select e.name as Employee,
    e.salary as Salary,
    d.name as Department,
    dense_rank() over(partition by e.departmentId order by e.salary DESC) as rnk
    from Employee e
    join Department d
    on e.departmentId = d.id
)
select Department,Employee,Salary
from ranked_salaries
where rnk <= 3;