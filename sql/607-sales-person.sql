-- LeetCode #607: Sales Person
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/sales-person/
-- Tags: JOIN

select name from SalesPerson where name not in (select B.name from Orders A inner join SalesPerson B on A.sales_id = B.sales_id
inner join Company C on A.com_id = C.com_id where C.name = 'RED')
