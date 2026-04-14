-- Task 1
-- 1.1
-- а)
SELECT COUNT(*) AS `cnt` FROM `clients`;
-- б)
SELECT COUNT(*) AS `cnt` FROM `clients` WHERE YEAR(`dbirth`) > 1990;
-- в)
SELECT `name`, COUNT(*) AS `cnt`
FROM `clients`
WHERE `name` IN ('Thomas', 'Barbara', 'Willie')
GROUP BY `name`;
-- 1.2
-- а)
SELECT YEAR(`dbirth`), COUNT(*) AS `cnt`
FROM `clients`
GROUP BY YEAR(`dbirth`);
-- б)
SELECT YEAR(`dbirth`), `gender`, COUNT(*) AS `cnt`
FROM `clients`
GROUP BY YEAR(`dbirth`), `gender`;
-- 1.3
SELECT MONTHNAME(`dbirth`), COUNT(*) AS `cnt`
FROM `clients`
GROUP BY MONTHNAME(`dbirth`);
-- 1.4
-- а)
SELECT AVG(TIMESTAMPDIFF(YEAR, `dbirth`, CURDATE())) AS `avg_age`
FROM `clients`;
-- б)
SELECT MIN(TIMESTAMPDIFF(YEAR, `dbirth`, CURDATE())) AS `min_age`
FROM `clients`;
-- в)
SELECT MAX(TIMESTAMPDIFF(YEAR, `dbirth`, CURDATE())) AS `max_age`
FROM `clients`;
-- 1.5
SELECT CONCAT(LEFT(YEAR(`dbirth`), 3), '0-', LEFT(YEAR(`dbirth`), 3), '9') AS `period`, GROUP_CONCAT(DISTINCT `name`) AS `names`
FROM `clients`
WHERE YEAR(`dbirth`) BETWEEN 1960 AND 1999
GROUP BY `period`;
-- 1.6
SELECT CONCAT(LEFT(YEAR(`dbirth`), 3), '0-', LEFT(YEAR(`dbirth`), 3), '9') AS `period`, `gender`, COUNT(`gender`) AS `gender_cnt`
FROM `clients`
WHERE YEAR(`dbirth`) BETWEEN 1940 AND 1979
GROUP BY `period`, `gender`
ORDER BY `period` ASC;


-- Task 2
-- 2.1
SOURCE --path/to/stats.sql;
-- 2.2
-- а)
SELECT `date` AS `dates`, SUM(`hits`) AS `all_hits`, SUM(`loads`) AS `all_loads` FROM `stats` GROUP BY `dates` ORDER BY `date`;
-- б)
SELECT `country` AS `countries`, SUM(`hits`) AS `all_hits`, SUM(`loads`) AS `all_loads` FROM `stats` GROUP BY `country` ORDER BY `country`;
-- в)
SELECT `date` AS `dates`, `country` AS `countries`, SUM(`hits`) AS `all_hits`, SUM(`loads`) AS `all_loads` FROM `stats` GROUP BY `dates`, `countries` ORDER BY `dates`;
-- 2.3
-- а)
SELECT AVG(`sum_hits`) FROM (SELECT `date`, SUM(`hits`) AS `sum_hits` FROM `stats` GROUP BY `date`) AS t1;
-- б)
SELECT AVG(`sum_hits`) FROM (SELECT `country`, SUM(`hits`) AS `sum_hits` FROM `stats` GROUP BY `date`) AS t2;
-- 2.4
-- а)
SELECT AVG(`sum_loads`) FROM (SELECT `date`, SUM(`loads`) AS `sum_loads` FROM `stats` GROUP BY `date`) AS t1;
-- б)
SELECT AVG(`sum_loads`) FROM (SELECT `country`, SUM(`loads`) AS `sum_loads` FROM `stats` GROUP BY `date`) AS t2;
-- 2.5
-- а)
SELECT MIN(`sum_loads`), MAX(`sum_loads`) FROM (SELECT `date`, SUM(`loads`) AS `sum_loads` FROM `stats` GROUP BY `date`) AS t1;
-- б)
SELECT MIN(`sum_loads`), MAX(`sum_loads`) FROM (SELECT `country`, SUM(`loads`) AS `sum_loads` FROM `stats` GROUP BY `country`) AS t2;
-- 2.6
SELECT `date` AS `dates`, SUM(`hits`) / SUM(`loads`) AS `conversion` FROM `stats` GROUP BY `dates` ORDER BY `dates`;
-- 2.7
SELECT `date` AS `dates`, SUM(`hits`) / SUM(`loads`) AS `conversion` FROM `stats` GROUP BY `dates` ORDER BY `conversion` DESC LIMIT 1;
-- 2.8
SELECT `country` AS `countries`, SUM(`hits`) / SUM(`loads`) AS `conversion` FROM `stats` GROUP BY `country` ORDER BY `conversion` DESC LIMIT 5;
