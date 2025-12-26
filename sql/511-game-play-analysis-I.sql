-- LeetCode #511: Game Play Analysis I
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/game-play-analysis-i/
-- Tags: Window function/group by

select player_id, event_date as first_login from 
(select *,RANK() OVER (PARTITION BY player_id ORDER BY event_date) as rnk 
FROM Activity) temp where rnk = 1 

--Another solution
SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id