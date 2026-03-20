CREATE TABLE `board_games`(
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `author` VARCHAR(255) NOT NULL,
    `article` INT(10) UNSIGNED NOT NULL,
    `availability` TINYINT(1) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO board_games (`name`, `price`, `author`, `article`, `availability`) VALUES ('Мачи Коро', 1290, 'Масао Суганума', 40993, 1), ('Миддара: Непреднамеренное зло. Акт 1', 24990, 'Бруклин Ландберг', 187892, 0), ('Ужас Аркхэма. Карточная игра', 2990, 'Нэйт Френч', 185140, 1), ('Городской убийца', 2490, 'Артур Ходжиков', 102285, 1), ('Root', 4750, 'Коул Верль', 73969, 0);
