-- 每日GMV成交额
SELECT
    DATE(ts) AS dt,
    SUM(price) AS gmv
FROM user_behavior
WHERE behavior_type = 'buy'
GROUP BY dt
ORDER BY dt;