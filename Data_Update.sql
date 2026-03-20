-- 1.1)
-- 1)
SELECT * FROM `clients` WHERE `name` = 'Gary' AND lastname = 'Harrison' LIMIT 10;
UPDATE `clients` SET `dbirth` = 19301021 WHERE `id` = 782 LIMIT 1;
SELECT * FROM `clients` WHERE `name` = 'Michael' AND lastname = 'Atwood' LIMIT 10;
UPDATE `clients` SET `dbirth` = 19340412 WHERE `id` = 297 LIMIT 1;
SELECT * FROM `clients` WHERE `name` = 'Amy' AND lastname = 'Majors' LIMIT 10;
UPDATE `clients` SET `dbirth` = 19750801 WHERE `id` = 240 LIMIT 1;
SELECT * FROM `clients` WHERE `name` = 'Katherine' AND lastname = 'Smith' LIMIT 10;
UPDATE `clients` SET `dbirth` = 19590922 WHERE `id` = 306 LIMIT 1;

-- 2)
SELECT * FROM `clients` WHERE `dbirth` < 19330101 LIMIT 50;
UPDATE `clients` SET `phone` = NULL WHERE `id` IN (94, 109, 136, 147, 217, 301, 365, 416, 420, 441, 540, 782, 950) LIMIT 13;

-- 3)
SELECT * FROM `clients` WHERE `name` = 'John' AND `lastname` = 'Ohara' LIMIT 1;
UPDATE `clients` SET `name` = 'Johanna', `gender` = 'F' WHERE `id` = 570 LIMIT 1;

-- 4)
SELECT * FROM `clients` WHERE `name` = 'Humberto' AND `lastname` = 'Hoosier' LIMIT 10;
UPDATE `clients` SET `phone` = '5645456' WHERE `id` = 673 LIMIT 1;
SELECT * FROM `clients` WHERE `name` = 'Irene' AND `lastname` = 'Schreiber' LIMIT 10;
UPDATE `clients` SET `phone` = '78631301' WHERE `id` = 447 LIMIT 1;
SELECT * FROM `clients` WHERE `name` = 'Donna' AND `lastname` = 'Wallace' LIMIT 10;
UPDATE `clients` SET `phone` = '120556479' WHERE `id` = 293 LIMIT 1;

-- 5)
DELETE FROM `clients` WHERE `id` IN (215, 340, 449, 470, 607) LIMIT 5;

-- 6)
SELECT * FROM `clients`  WHERE      (`dbirth` BETWEEN 19410101 AND 19410430 OR `dbirth` BETWEEN 19720910 AND
19720915) AND `gender` = 'M' LIMIT 100;
DELETE FROM `clients` WHERE `id` IN (383, 839) LIMIT 2;

-- 2.1)
SELECT * FROM `board_games`; -- Одна строка
UPDATE `board_games` SET `price` = 1290 WHERE `id` = 2 LIMIT 1; -- Одна строка

SELECT * FROM `board_games` WHERE `name` = 'Мачи Коро' LIMIT 1; -- Одна строка
DELETE FROM `board_games` WHERE `id` = 1 LIMIT 1; -- Одна строка

SELECT * FROM `board_games` WHERE `price` BETWEEN 2000 AND 3000 LIMIT 10; -- Две строки
UPDATE `board_games` SET `availability` = 0 WHERE `id` IN (3, 4) LIMIT 2; -- Две строки

SELECT * FROM `board_games` WHERE `name` = 'Ужас Аркхэма. Карточная игра' LIMIT 1; -- Одна строка
REPLACE INTO `board_games` VALUES (3, 'Ужас Аркхэма. Карточная игра', 2990.00, 'Нэйт Френч и М. Дж. Ньюман', 185140, 0); -- Две строки

SELECT * FROM `board_games` WHERE `availability` = 0 LIMIT 10;
UPDATE `board_games` SET `availability` = 1 WHERE `id` IN (2, 3, 4, 5) LIMIT 4;
