mysql> CREATE TABLE products (
    ->     product_id INT,
    ->     product_name VARCHAR(50),
    ->     price DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> ALTER TABLE products
    -> ADD category VARCHAR(30);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO products
    -> VALUES (1, 'Pen', 20.00, 'Stationery');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO products
    -> VALUES (2, 'Pencil', 10.00, 'Stationery');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO products
    -> VALUES (3, 'Notebook', 80.00, 'Stationery');
Query OK, 1 row affected (0.01 sec)

mysql> desc products;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| product_id   | int           | YES  |     | NULL    |       |
| product_name | varchar(50)   | YES  |     | NULL    |       |
| price        | decimal(10,2) | YES  |     | NULL    |       |
| category     | varchar(30)   | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> UPDATE products
    -> SET price = 100
    -> WHERE product_name = 'Notebook';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM products
    -> WHERE product_name = 'Notebook';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT *
    -> FROM products;
+------------+--------------+-------+------------+
| product_id | product_name | price | category   |
+------------+--------------+-------+------------+
|          1 | Pen          | 20.00 | Stationery |
|          2 | Pencil       | 10.00 | Stationery |
+------------+--------------+-------+------------+
2 rows in set (0.00 sec)

mysql> SELECT product_name, price
    -> FROM products;
+--------------+-------+
| product_name | price |
+--------------+-------+
| Pen          | 20.00 |
| Pencil       | 10.00 |
+--------------+-------+
2 rows in set (0.00 sec)

mysql> desc products;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| product_id   | int           | YES  |     | NULL    |       |
| product_name | varchar(50)   | YES  |     | NULL    |       |
| price        | decimal(10,2) | YES  |     | NULL    |       |
| category     | varchar(30)   | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)