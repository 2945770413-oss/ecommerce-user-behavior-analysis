-- 次日留存分析
USE ecommerce;

WITH first_day AS (
    SELECT user_id, MIN(DATE(datetime)) AS first_dt
    FROM user_behavior
    GROUP BY user_id
)
SELECT
    COUNT(DISTINCT f.user_id) AS new_users,
    COUNT(DISTINCT b.user_id) AS retention_1d,
    ROUND(COUNT(DISTINCT b.user_id)/COUNT(DISTINCT f.user_id),3) AS retention_rate
FROM first_day f
LEFT JOIN user_behavior b
    ON f.user_id = b.user_id 
AND DATEDIFF(DATE(b.datetime), f.first_dt) = 1;