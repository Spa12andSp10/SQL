-- views
-- 1)

CREATE OR REPLACE VIEW `auction_details` AS
SELECT
    a.id AS auction_id,
    t.name AS tank_name,
    n.name AS nation,
    c.name AS class,
    r.rank AS tank_rank,
    r.br AS battle_rating,
    a.start_price,
    a.finish_price,
    a.step,
    cur.name AS currency,
    a.auction_date,
    CASE
        WHEN a.purchase = 1 THEN 'Sold'
        ELSE 'Not sold'
    END AS status,
    p.nickname AS buyer_nickname
FROM auctions a
JOIN tanks t ON a.tank_id = t.id
JOIN nations n ON t.nation_id = n.id
JOIN classes c ON t.class_id = c.id
JOIN ranks r ON t.rank_id = r.id
JOIN currencies cur ON a.currency_id = cur.id
LEFT JOIN players p ON a.player_id = p.id;

-- 2)

CREATE OR REPLACE VIEW `sales_statistics` AS
SELECT
    n.name AS nation,
    r.rank AS tank_rank,
    COUNT(a.id) AS total_auctions,
    SUM(a.purchase) AS sold_count,
    ROUND(SUM(a.purchase) * 100.0 / COUNT(a.id), 2) AS sold_percentage,
    ROUND(AVG(a.finish_price), 2) AS avg_sold_price,
    MIN(a.start_price) AS min_start_price,
    MAX(a.start_price) AS max_start_price
FROM auctions a
JOIN tanks t ON a.tank_id = t.id
JOIN nations n ON t.nation_id = n.id
JOIN ranks r ON t.rank_id = r.id
WHERE a.purchase = 1
GROUP BY n.name, r.rank
ORDER BY n.name, r.rank;

-- 3)

CREATE OR REPLACE VIEW `players_statistic` AS
SELECT
  p.nickname AS nickname,
  c.name AS currency,
  SUM(a.finish_price) AS total_spent
FROM auctions a
JOIN players p ON a.player_id = p.id
JOIN currencies c ON a.currency_id = c.id
WHERE a.purchase = 1
GROUP BY p.nickname, c.name
ORDER BY p.nickname;
