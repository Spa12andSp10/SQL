-- 1)

CREATE TABLE `changes`(
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `product_id` int unsigned DEFAULT NULL,
    `changed_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `old_price` decimal(10,2) DEFAULT NULL,
    `new_price` decimal(10,2) DEFAULT NULL,
    PRIMARY KEY (`id`)
);


DELIMITER //

CREATE TRIGGER save_dates
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO changes (product_id, changed_at, old_price, new_price)
    VALUES (NEW.id, NOW(), OLD.cost, NEW.cost);
END //

DELIMITER ;

UPDATE products SET cost = 9000 WHERE id = 1;

-- 2)

DELIMITER //

CREATE TRIGGER delete_group
BEFORE DELETE ON `groups`
FOR EACH ROW
BEGIN
    UPDATE products SET available = 0 WHERE group_id = OLD.id;
    UPDATE sales SET product_id = NULL, qty = 0 WHERE product_id IN (SELECT id FROM products WHERE group_id = OLD.id);
END //

DELIMITER ;

DELETE FROM `groups` WHERE name = "Пилы";
