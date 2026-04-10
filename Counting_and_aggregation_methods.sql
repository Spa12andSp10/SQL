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
SELECT DAY(`date`) AS `dates`, SUM(`hits`) AS `all_hits`, SUM(`loads`) AS `all_loads` FROM `stats` GROUP BY DAY(`date`) ORDER BY DAY(`date`);
-- б)
SELECT `country` AS `countries`, SUM(`hits`) AS `all_hits`, SUM(`loads`) AS `all_loads` FROM `stats` GROUP BY `country` ORDER BY `country`;
-- в)
SELECT DAY(`date`) AS `dates`, `country` AS `countries`, SUM(`hits`) AS `all_hits`, SUM(`loads`) AS `all_loads` FROM `stats` GROUP BY `dates`, `countries` ORDER BY `dates`;
-- 2.3
-- а)
SELECT DAY(`date`) AS `dates`, AVG(`hits`) AS `avg_hits` FROM `stats` GROUP BY `dates` ORDER BY `dates`;
-- б)
SELECT `country` AS `countries`, AVG(`hits`) AS `avg_hits` FROM `stats` GROUP BY `countries` ORDER BY `countries`;
-- 2.4
-- а)
SELECT DAY(`date`) AS `dates`, AVG(`loads`) AS `avg_loads` FROM `stats` GROUP BY `dates` ORDER BY `dates`;
-- б)
SELECT `country` AS `countries`, AVG(`loads`) AS `avg_loads` FROM `stats` GROUP BY `countries` ORDER BY `countries`;
-- 2.5
-- а)
SELECT DAY(`date`) AS `dates`, MIN(`loads`) AS `min_loads`, MAX(`loads`) AS `max_loads` FROM `stats` GROUP BY `dates` ORDER BY `dates`;
-- б)
SELECT `country` AS `countries`, MIN(`loads`) AS `min_loads`, MAX(`loads`) AS `max_loads` FROM `stats` GROUP BY `country` ORDER BY `country`;
-- 2.6
SELECT DAY(`date`) AS `dates`, SUM(`loads`) / SUM(`hits`) AS `conversion` FROM `stats` GROUP BY `dates` ORDER BY `dates`;
-- 2.7
SELECT DAY(`date`) AS `dates`, SUM(`loads`) / SUM(`hits`) AS `conversion` FROM `stats` GROUP BY `dates` ORDER BY `conversion` DESC LIMIT 1;
-- 2.8
SELECT DAY(`date`) AS `dates`, SUM(`loads`) / SUM(`hits`) AS `conversion` FROM `stats` GROUP BY `dates` ORDER BY `conversion` DESC LIMIT 5;
