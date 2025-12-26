-- LeetCode #577: Employee Bonus
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/employee-bonus/
-- Tags: JOIN

select A.name,B.bonus from Employee A left join Bonus B on A.empId = B.empId
where B.bonus < 1000 or B.bonus is null
