mysql> CREATE TABLE sales (
    ->     sale_id INT,
    ->     employee_name VARCHAR(50),
    ->     department VARCHAR(30),
    ->     product VARCHAR(30),
    ->     quantity INT,
    ->     amount DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> INSERT INTO sales
    -> VALUES
    -> (1, 'Priya', 'IT', 'Laptop', 2, 100000),
    -> (2, 'Rahul', 'IT', 'Mouse', 5, 5000),
    -> (3, 'Anil', 'HR', 'Laptop', 1, 50000),
    -> (4, 'Sneha', 'HR', 'Keyboard', 3, 9000),
    -> (5, 'Kiran', 'Sales', 'Laptop', 4, 200000),
    -> (6, 'Arjun', 'Sales', 'Mouse', 10, 10000),
    -> (7, 'Divya', 'IT', 'Keyboard', 2, 6000),
    -> (8, 'Ravi', 'Sales', 'Monitor', 3, 45000);
Query OK, 8 rows affected (0.05 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT COUNT(*)
    -> FROM sales;
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+
1 row in set (0.03 sec)

mysql> SELECT COUNT(employee_name)
    -> FROM sales;
+----------------------+
| COUNT(employee_name) |
+----------------------+
|                    8 |
+----------------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(amount)
    -> FROM sales;
+-------------+
| SUM(amount) |
+-------------+
|   425000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(quantity)
    -> FROM sales;
+---------------+
| SUM(quantity) |
+---------------+
|            30 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(amount)
    -> FROM sales;
+--------------+
| AVG(amount)  |
+--------------+
| 53125.000000 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(amount)
    -> FROM sales;
+-------------+
| MAX(amount) |
+-------------+
|   200000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(amount)
    -> FROM sales;
+-------------+
| MIN(amount) |
+-------------+
|     5000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT department, SUM(amount)
    -> FROM sales
    -> GROUP BY department;
+------------+-------------+
| department | SUM(amount) |
+------------+-------------+
| IT         |   111000.00 |
| HR         |    59000.00 |
| Sales      |   255000.00 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT department, COUNT(*)
    -> FROM sales
    -> GROUP BY department;
+------------+----------+
| department | COUNT(*) |
+------------+----------+
| IT         |        3 |
| HR         |        2 |
| Sales      |        3 |
+------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT department, SUM(amount)
    -> FROM sales
    -> GROUP BY department
    -> HAVING SUM(amount) > 100000;
+------------+-------------+
| department | SUM(amount) |
+------------+-------------+
| IT         |   111000.00 |
| Sales      |   255000.00 |
+------------+-------------+
2 rows in set (0.00 sec)
