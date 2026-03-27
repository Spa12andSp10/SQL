CREATE TABLE `employees`(
`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`full_name` VARCHAR(255) NOT NULL,
`position_id` INT(10) NOT NULL,
`position` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`)
);

INSERT INTO `employees` (`full_name`, `position_id`, `position`) VALUES ('Иванов Иван Иванович', 101, 'Менеджер'),
('Петрова Анна Сергеевна', 102, 'Разработчик'),
('Сидоров Алексей Владимирович', 102, 'Разработчик'),
('Козлова Елена Павловна', 103, 'Аналитик'),
('Смирнов Дмитрий Николаевич', 101, 'Менеджер');

CREATE TABLE `positions`( `id` INT(10) NOT NULL, `position` VARCHAR(255) NOT NULL, PRIMARY KEY (`id`));

INSERT INTO `positions` (`id`, `position`) SELECT DISTINCT `position_id`, `position` FROM `employees`;

ALTER TABLE `employees` DROP `position`;

ALTER TABLE `employees` ADD CONSTRAINT `fk_employee_position` FOREIGN KEY (`position_id`) REFERENCES `positions`(`id`);
