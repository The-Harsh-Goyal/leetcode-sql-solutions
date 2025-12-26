-- LeetCode #608: Tree Node
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/tree-node/
-- Tags: TREE

select id,
    CASE 
    WHEN p_id is null
    THEN 'Root'
    WHEN id in (select distinct p_id from Tree) and p_id is not null
    THEN 'Inner'
    ELSE 'Leaf' END AS type
FROM Tree
