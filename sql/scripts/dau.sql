CREATE SCHEMA IF NOT EXISTS ecommerce; USE ecommerce;
 -- 创建表（专门放100万行数据） 
CREATE TABLE user_behavior ( user_id BIGINT, item_id BIGINT, category_id BIGINT, behavior_type VARCHAR(10), ts BIGINT -- 原始时间戳 );
 -- 改密码，连接python，用python读取数据
ALTER USER 'root'@'localhost' 
IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;
 -- 转换时间戳
USE ecommerce;

-- 直接更新已存在的 datetime 列
UPDATE user_behavior SET datetime = FROM_UNIXTIME(ts);

-- 验证一下结果
SELECT user_id, behavior_type, ts, datetime FROM user_behavior LIMIT 5;
 
 -- 日活趋势
SELECT DATE(datetime) AS dt, COUNT(DISTINCT user_id) AS dau
FROM user_behavior
GROUP BY dt
ORDER BY dt;
 