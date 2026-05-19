-- 行为漏斗分析
USE ecommerce;

SELECT
    COUNT(DISTINCT CASE WHEN behavior_type='pv' THEN user_id END) AS pv_users,
    COUNT(DISTINCT CASE WHEN behavior_type='fav' THEN user_id END) AS fav_users,
    COUNT(DISTINCT CASE WHEN behavior_type='cart' THEN user_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN behavior_type='buy' THEN user_id END) AS buy_users
FROM user_behavior;