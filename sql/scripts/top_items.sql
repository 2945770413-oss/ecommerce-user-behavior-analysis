-- 爆款商品top10
SELECT
    item_id,
    COUNT(*) AS total_views,
    COUNT(CASE WHEN behavior_type='buy' THEN 1 END) AS total_purchases
FROM user_behavior
GROUP BY item_id
ORDER BY total_purchases DESC
LIMIT 10;