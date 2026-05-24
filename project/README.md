# Отчет по базе данных War Thunder Auction

## Описание

Эта база данных предназначена для упрощения проведения аукционов в компьютерной игре War Thunder.

## Особенности структуры

- Поля `finish_price` и `player_id` в таблице `auctions` могут принимать значение `NULL` (лот может быть не куплен)
- Поле `purchase` принимает значение `0` (лот не куплен) или `1` (лот куплен)
- Поля типа `decimal(25, 2)` позволяют хранить очень большие ставки (стартовая цена может составлять больше миллиона)

## Связи между таблицами

- `tanks` → `ranks`: many-to-one
- `tanks` → `classes`: many-to-one
- `tanks` → `nations`: many-to-one
- `auctions` → `tanks`: many-to-one
- `auctions` → `currencies`: many-to-one
- `auctions` → `players`: many-to-one

## Типовые запросы

### SELECT (Выборка данных)

#### Простые выборки

```sql
-- Все танки определенной нации (USSR - id=3)
SELECT * FROM tanks WHERE nation_id = 3;

-- Все проданные танки
SELECT * FROM auctions WHERE purchase = 1;

-- Топ-5 самых дорогих проданных танков
SELECT * FROM auctions 
WHERE purchase = 1 
ORDER BY finish_price DESC 
LIMIT 5;

-- Аукционы с ценой от 1000 до 10000
SELECT * FROM auctions 
WHERE start_price BETWEEN 1000 AND 10000;
```

### INSERT (Добавление данных)

#### Добавление в справочники

```sql
-- Новый класс танков
INSERT INTO classes (name) VALUES ('tank destroyer');

-- Новая валюта
INSERT INTO currencies (name) VALUES ('Battle Pass Coins');

-- Новый ранг
INSERT INTO ranks (rank, br) VALUES (9, '12.0-13.7');

-- Новый игрок
INSERT INTO players (nickname) VALUES ('SuperPlayer2024');
```

#### Добавление танков

```sql
-- Добавление нескольких танков
INSERT INTO tanks (name, rank_id, nation_id, class_id) VALUES
('Leopard 2A7', 8, 2, 1),
('Challenger 3', 8, 4, 1),
('Type 10', 8, 5, 1);
```

### UPDATE (Обновление данных)

#### Обновление справочников

```sql
-- Изменить название нации
UPDATE nations SET name = 'Soviet Union' WHERE name = 'USSR';

-- Обновить диапазон БР для 8 ранга
UPDATE ranks SET br = '11.0-13.0' WHERE rank = 8;

-- Сменить ник игрока
UPDATE players SET nickname = 'ProPlayer123' WHERE id = 1;
```

### DELETE (Удаление данных)

```sql
-- Удалить несостоявшиеся аукционы старше года
DELETE FROM auctions 
WHERE purchase = 0 AND auction_date < DATE_SUB(NOW(), INTERVAL 1 YEAR);

-- Удалить игрока без покупок
DELETE FROM players 
WHERE id NOT IN (SELECT DISTINCT player_id FROM auctions WHERE player_id IS NOT NULL);
```

