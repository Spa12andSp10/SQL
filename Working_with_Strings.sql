-- 1)
SELECT `id`, UPPER(`name`) FROM `clients`;
SELECT `id`, LOWER(`name`) FROM `clients`;

-- 2)
SELECT CONCAT(`name`, ' ', `lastname`) AS `full_name`, CONCAT(LEFT(`phone`, 3), '***', RIGHT(`phone`, 1)) AS `phone_number` FROM `clients`;

-- 3)
SELECT CONCAT(LEFT(`name`, 1), '. ', `lastname`) AS `short_name` FROM `clients` WHERE POSITION('tt' IN `lastname`) != 0 OR POSITION('ss' IN `lastname`) != 0 OR
POSITION('ll' IN `lastname`) != 0;

-- 4)
-- a)
SELECT * FROM `clients` WHERE `phone` LIKE '586%';
SELECT * FROM `clients` WHERE LEFT(`phone`, 3 ) = '586';
SELECT * FROM `clients` WHERE SUBSTRING(`phone`, 1, 3) = '586';
SELECT * FROM `clients` WHERE POSITION('586' IN `phone`) = 1;
SELECT * FROM `clients` WHERE INSTR(`phone`, '586') = 1;

-- б)
SELECT * FROM `clients` WHERE POSITION('657' IN `phone`) != 0;
SELECT * FROM `clients` WHERE LOCATE('657', `phone`) > 0;
SELECT * FROM `clients` WHERE INSTR(`phone`, '657') > 0;
SELECT * FROM `clients` WHERE `phone` LIKE '%657%';

-- в)
SELECT * FROM `clients` WHERE RIGHT(`phone`, 3) = '707';
SELECT * FROM `clients` WHERE `phone` LIKE '%707';
SELECT * FROM `clients` WHERE SUBSTRING(`phone`, -3) = '707';
SELECT * FROM `clients` WHERE LEFT(REVERSE(`phone`), 3) = '707';
