mysql> SELECT *
    -> FROM sales
    -> ORDER BY amount ASC;
+---------+---------------+------------+----------+----------+-----------+
| sale_id | employee_name | department | product  | quantity | amount    |
+---------+---------------+------------+----------+----------+-----------+
|       2 | Rahul         | IT         | Mouse    |        5 |   5000.00 |
|       7 | Divya         | IT         | Keyboard |        2 |   6000.00 |
|       4 | Sneha         | HR         | Keyboard |        3 |   9000.00 |
|       6 | Arjun         | Sales      | Mouse    |       10 |  10000.00 |
|       8 | Ravi          | Sales      | Monitor  |        3 |  45000.00 |
|       3 | Anil          | HR         | Laptop   |        1 |  50000.00 |
|       1 | Priya         | IT         | Laptop   |        2 | 100000.00 |
|       5 | Kiran         | Sales      | Laptop   |        4 | 200000.00 |
+---------+---------------+------------+----------+----------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM sales
    -> ORDER BY amount DESC;
+---------+---------------+------------+----------+----------+-----------+
| sale_id | employee_name | department | product  | quantity | amount    |
+---------+---------------+------------+----------+----------+-----------+
|       5 | Kiran         | Sales      | Laptop   |        4 | 200000.00 |
|       1 | Priya         | IT         | Laptop   |        2 | 100000.00 |
|       3 | Anil          | HR         | Laptop   |        1 |  50000.00 |
|       8 | Ravi          | Sales      | Monitor  |        3 |  45000.00 |
|       6 | Arjun         | Sales      | Mouse    |       10 |  10000.00 |
|       4 | Sneha         | HR         | Keyboard |        3 |   9000.00 |
|       7 | Divya         | IT         | Keyboard |        2 |   6000.00 |
|       2 | Rahul         | IT         | Mouse    |        5 |   5000.00 |
+---------+---------------+------------+----------+----------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM sales
    -> ORDER BY department ASC, amount DESC;
+---------+---------------+------------+----------+----------+-----------+
| sale_id | employee_name | department | product  | quantity | amount    |
+---------+---------------+------------+----------+----------+-----------+
|       3 | Anil          | HR         | Laptop   |        1 |  50000.00 |
|       4 | Sneha         | HR         | Keyboard |        3 |   9000.00 |
|       1 | Priya         | IT         | Laptop   |        2 | 100000.00 |
|       7 | Divya         | IT         | Keyboard |        2 |   6000.00 |
|       2 | Rahul         | IT         | Mouse    |        5 |   5000.00 |
|       5 | Kiran         | Sales      | Laptop   |        4 | 200000.00 |
|       8 | Ravi          | Sales      | Monitor  |        3 |  45000.00 |
|       6 | Arjun         | Sales      | Mouse    |       10 |  10000.00 |
+---------+---------------+------------+----------+----------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT DISTINCT department
    -> FROM sales;
+------------+
| department |
+------------+
| IT         |
| HR         |
| Sales      |
+------------+
3 rows in set (0.00 sec)

mysql> SELECT DISTINCT product
    -> FROM sales;
+----------+
| product  |
+----------+
| Laptop   |
| Mouse    |
| Keyboard |
| Monitor  |
+----------+
4 rows in set (0.00 sec)

mysql> SELECT DISTINCT department, product
    -> FROM sales;
+------------+----------+
| department | product  |
+------------+----------+
| IT         | Laptop   |
| IT         | Mouse    |
| HR         | Laptop   |
| HR         | Keyboard |
| Sales      | Laptop   |
| Sales      | Mouse    |
| IT         | Keyboard |
| Sales      | Monitor  |
+------------+----------+
8 rows in set (0.00 sec)

mysql> SELECT ROUND(123.4567);
+-----------------+
| ROUND(123.4567) |
+-----------------+
|             123 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(123.4567, 2);
+--------------------+
| ROUND(123.4567, 2) |
+--------------------+
|             123.46 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(AVG(amount), 2)
    -> FROM sales;
+-----------------------+
| ROUND(AVG(amount), 2) |
+-----------------------+
|              53125.00 |
+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT CEIL(12.3);
+------------+
| CEIL(12.3) |
+------------+
|         13 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT FLOOR(12.9);
+-------------+
| FLOOR(12.9) |
+-------------+
|          12 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SQRT(25);
+----------+
| SQRT(25) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT POWER(2, 3);
+-------------+
| POWER(2, 3) |
+-------------+
|           8 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT ABS(-50);
+----------+
| ABS(-50) |
+----------+
|       50 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT MOD(10, 3);
+------------+
| MOD(10, 3) |
+------------+
|          1 |
+------------+
1 row in set (0.00 sec)