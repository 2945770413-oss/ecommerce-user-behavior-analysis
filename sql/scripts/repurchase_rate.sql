-- 用户复购率
SELECT
    COUNT(CASE WHEN buy_count >=2 THEN user_id END)/COUNT(user_id) AS repurchase_rate
FROM(
    SELECT
        user_id,
        COUNT(*) AS buy_count
    FROM user_behavior
    WHERE behavior_type = 'buy'
    GROUP BY user_id
)t;