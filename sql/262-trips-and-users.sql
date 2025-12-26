-- LeetCode #262: Trips and Users
-- Difficulty: Hard
-- Link: https://leetcode.com/problems/trips-and-users/
-- Tags: CTE/group by

With client as (
    select * from Users where role = 'client'
),
driver as (
    select * from Users where role = 'driver'
),
trips as (
    select A.* from Trips A left join client C on A.client_id = C.users_id left join driver B on A.driver_id = B.users_id
where B.banned = 'No' and C.banned = 'No' and request_at between '2013-10-01' and '2013-10-03'
),
total_trips as (
select request_at as Day, count(id) as total from trips 
group by request_at
),
cancelled_trips as (
select request_at as Day, count(id) as cancelled from trips 
where status like '%cancelled%'
group by request_at
)
select A.Day, round(coalesce(cancelled,0)/coalesce(nullif(total,0),1),2) as 'Cancellation Rate' from total_trips A left join
cancelled_trips B on A.Day = B.Day

--Another solution
With client as (
    select * from Users where role = 'client'
),
driver as (
    select * from Users where role = 'driver'
),
trips as (
    select A.* from Trips A 
    inner join client C on A.client_id = C.users_id and C.banned = 'No'
    inner join driver B on A.driver_id = B.users_id and B.banned = 'No'
    where request_at between '2013-10-01' and '2013-10-03'
)
select request_at as Day,ROUND(SUM(CASE WHEN status like '%cancelled%' THEN 1 ELSE 0 END) / COUNT(request_at),2) AS "Cancellation Rate" from trips
group by request_at

order by request_at
