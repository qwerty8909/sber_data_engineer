-- DROP --
DROP TABLE IF EXISTS de11an.kore_log;
DROP TABLE IF EXISTS de11an.kore_log_report;

-- 01 --
CREATE TABLE de11an.kore_log
AS
WITH 
cte_ip AS (
SELECT 
	split_part (data, '	', 1) AS ip, 
	split_part (data, '	', 2) AS region
FROM 
	de.ip i 
),
cte_log AS (
SELECT 
	split_part (data, '	', 1) AS ip,
	to_date (split_part (data, '	', 4), 'YYYYMMDDHH24MISS') AS dt,
	split_part (data, '	', 5) AS link,
	split_part (data, '	', 8) AS user_agent
FROM 
	de.log l
)
SELECT
	dt,
	CAST (link AS varchar(50)),
	CAST (user_agent AS varchar(200)),
	CAST (region AS varchar(30))
FROM 
	cte_log e
LEFT JOIN  cte_ip j
	ON e.ip = j.ip
	
-- 02 --	
CREATE TABLE de11an.kore_log_report
AS
SELECT
	region, 
	CAST (browser AS varchar(10)) 
FROM (
    SELECT 
    	region, 
    	split_part (user_agent, '/', 1) AS browser, 
    	COUNT(*) AS count,
    	RANK () OVER (PARTITION BY region ORDER BY count(1) DESC) AS rank_
    FROM de11an.kore_log
    GROUP BY region, browser 
) AS t_table
WHERE rank_ = 1 AND region IS NOT NULL