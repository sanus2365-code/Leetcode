-- Write your PostgreSQL query statement below
with friends as(
    select requester_id as id
    from RequestAccepted

    union all

    select accepter_id as id
    from RequestAccepted
)
select id, count(*) as num
from friends
group by id
order by num DESC
limit 1; 