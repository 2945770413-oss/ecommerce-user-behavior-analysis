-- RFM用户分层
WITH rfm AS (
    SELECT
        user_id,
        DATEDIFF((SELECT MAX(datetime) FROM user_behavior), MAX(datetime)) AS recency,
        COUNT(CASE WHEN behavior_type='buy' THEN 1 END) AS frequency
    FROM user_behavior
    GROUP BY user_id
)
SELECT
    *,
    CASE 
        WHEN recency <= 2 AND frequency >= 2 THEN '高价值用户'
        WHEN recency > 5 AND frequency < 2 THEN '流失用户'
        ELSE '一般用户' 
    END AS user_segment
FROM rfm;