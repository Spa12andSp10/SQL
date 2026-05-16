-- 1)

DELIMITER //

CREATE FUNCTION find_anniversary(birth_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, birth_date, '2026-12-31');
    IF age % 5 = 0 AND age >= 5 THEN
        RETURN age;
    ELSE
        RETURN NULL;
    END IF;
END//

DELIMITER ;

SELECT last_name, first_name, middle_name, find_anniversary(birth_date) AS age FROM salesmen;

-- 2)

DELIMITER //

CREATE FUNCTION do_initials(last_name VARCHAR(255), first_name VARCHAR(255), middle_name VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE init_first_name VARCHAR(255);
    DECLARE init_middle_name VARCHAR(255);
    IF last_name IS NULL OR last_name = '' OR first_name IS NULL OR first_name = '' OR middle_name IS NULL OR middle_name = '' THEN
        RETURN '########';
    ELSE
        SET init_first_name = CONCAT(LEFT(first_name, 1), '.');
        SET init_middle_name = CONCAT(LEFT(middle_name, 1), '.');
        RETURN CONCAT(last_name, ' ', init_first_name, init_middle_name);
    END IF;
END//

DELIMITER ;

SELECT do_initials(last_name, first_name, middle_name) FROM salesmen;

-- 3)

DELIMITER //

CREATE FUNCTION calculate_income_salesman(rate DECIMAL(5, 2), income DECIMAL(15, 2))
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    RETURN rate * income;
END//

DELIMITER ;

SELECT sm.rate, s.income, calculate_income_salesman(sm.rate, s.income)
FROM salesmen sm
JOIN sales s ON s.salesman_id = sm.id
LIMIT 10;

-- 4)

DELIMITER //

CREATE FUNCTION calculate_income_company(product_cost DECIMAL(20, 2), qty INT)
RETURNS DECIMAL(20, 2)
DETERMINISTIC
BEGIN
    RETURN product_cost * qty;
END//

DELIMITER ;

SELECT calculate_income_company(`cost`, `qty`) AS `income`
FROM sales
LIMIT 10;

-- 5)

DELIMITER //

CREATE PROCEDURE find_anniversary_procedure()
BEGIN
    SELECT last_name, first_name, middle_name, `birth_date`, find_anniversary(birth_date) AS anniversary
    FROM salesmen
    HAVING anniversary IS NOT NULL;
END//

DELIMITER ;

CALL find_anniversary_procedure();

-- 6)

DELIMITER //

CREATE PROCEDURE find_all_about_product(IN g_id INT)
BEGIN
    SELECT p.name, g.name, p.plu, `p`.`cost`, p.available
    FROM products p
    JOIN `groups` g ON p.group_id = g.id
    WHERE g.id = g_id;
END//

DELIMITER ;

CALL find_all_about_product(1);

-- 7)

DELIMITER //

CREATE PROCEDURE find_sales_list(IN name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, IN start_date DATE ,IN period INT)
BEGIN
    IF period IS NULL OR (period != 14 AND period != 30) THEN
         SET period = 7;
    END IF;

    SELECT p.name, do_initials(sm.last_name, sm.first_name, sm.middle_name) AS full_name, s.date, s.qty
    FROM sales s
    JOIN salesmen sm ON s.salesman_id = sm.id
    JOIN products p ON s.product_id = p.id
    WHERE p.name LIKE name AND s.date BETWEEN start_date AND DATE_ADD(start_date, INTERVAL period DAY);

END//

DELIMITER ;

CALL find_sales_list("Пила Zubr ZPT-255-1800PL", '2022-01-11', 30);

-- 8)

DELIMITER //

CREATE PROCEDURE find_deception()
BEGIN
    SELECT SQL_CALC_FOUND_ROWS p.cost, s.cost, p.cost_changed_at, s.date
    FROM products p
    JOIN sales s ON s.product_id = p.id
    WHERE p.cost != s.cost AND (p.cost_changed_at IS NULL OR s.date <= p.cost_changed_at);

    IF FOUND_ROWS() = 0 THEN
        SELECT "No price discrepancies found" AS message;
    END IF;
END//

DELIMITER ;

CALL find_deception();
