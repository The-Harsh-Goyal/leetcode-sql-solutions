-- LeetCode #610: Triangle Judgement
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/triangle-judgement/
-- Tags: MATH

select x,y,z,
CASE    
WHEN (x+y) > z AND (y+z) > x AND (x+z) > y
THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle
