-- 1)
SELECT `name`, `lastname`, YEAR(`dbirth`) AS 'YEAR' FROM `clients`;

-- 2)
SELECT `name`, `lastname`, TIMESTAMPDIFF(YEAR, `dbirth`, NOW()) AS `age` FROM `clients`;
SELECT `name`, `lastname`, TIMESTAMPDIFF(YEAR, `dbirth`, '2026-12-31') AS `age` FROM `clients`;

-- 3)
SELECT `name`, `lastname`, TIMESTAMPDIFF(YEAR, `dbirth`, '1992-12-08') AS `age_on_1992` FROM `clients` WHERE `dbirth` < '1992-12-08';
SELECT `name`, `lastname`, TIMESTAMPDIFF(YEAR, `dbirth`, '2024-07-15') AS `age_on_2024` FROM `clients` WHERE `dbirth` < '2024-07-15';

-- 4)
SELECT * FROM `clients`  WHERE      DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(`dbirth`), '-', DAY(`dbirth`)))     BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY;
SELECT * FROM `clients` WHERE DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(`dbirth`), '-', DAY(`dbirth`))) BETWEEN CURDATE() AND CURDATE() + INTERVAL 14 DAY;
SELECT * FROM `clients` WHERE DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(`dbirth`), '-', DAY(`dbirth`))) BETWEEN CURDATE() AND '2026-03-31';
