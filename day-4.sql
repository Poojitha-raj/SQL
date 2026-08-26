mysql> CREATE TABLE employee_filter (
    ->     emp_id INT,
    ->     emp_name VARCHAR(50),
    ->     age INT,
    ->     department VARCHAR(30),
    ->     salary DECIMAL(10,2),
    ->     city VARCHAR(30),
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql>
mysql> INSERT INTO employee_filter
    -> VALUES
    -> (1, 'Priya', 22, 'IT', 45000, 'Hyderabad', 'priya@gmail.com'),
    -> (2, 'Rahul', 28, 'HR', 55000, 'Chennai', 'rahul@gmail.com'),
    -> (3, 'Anil', 35, 'IT', 75000, 'Hyderabad', NULL),
    -> (4, 'Sneha', 25, 'Finance', 60000, 'Bangalore', 'sneha@gmail.com'),
    -> (5, 'Kiran', 30, 'Sales', 50000, 'Hyderabad', NULL),
    -> (6, 'Arjun', 40, 'IT', 90000, 'Mumbai', 'arjun@gmail.com'),
    -> (7, 'Divya', 27, 'HR', 48000, 'Chennai', 'divya@gmail.com');
Query OK, 7 rows affected (0.05 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE department = 'IT';
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      1 | Priya    |   22 | IT         | 45000.00 | Hyderabad | priya@gmail.com |
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
3 rows in set (0.04 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE salary > 60000;
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE age >= 30;
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      5 | Kiran    |   30 | Sales      | 50000.00 | Hyderabad | NULL            |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE salary BETWEEN 50000 AND 75000;
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      2 | Rahul    |   28 | HR         | 55000.00 | Chennai   | rahul@gmail.com |
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      4 | Sneha    |   25 | Finance    | 60000.00 | Bangalore | sneha@gmail.com |
|      5 | Kiran    |   30 | Sales      | 50000.00 | Hyderabad | NULL            |
+--------+----------+------+------------+----------+-----------+-----------------+
4 rows in set (0.00 sec)

mysql> WHERE city = 'Hyderabad'
    ->    OR city = 'Chennai'
    ->    OR city = 'Mumbai';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE city = 'Hyderabad'
   OR city = 'Chennai'
   OR city = 'Mumbai'' at line 1
mysql> SELECT *
    -> FROM employee_filter
    -> WHERE city IN ('Hyderabad', 'Chennai', 'Mumbai');
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      1 | Priya    |   22 | IT         | 45000.00 | Hyderabad | priya@gmail.com |
|      2 | Rahul    |   28 | HR         | 55000.00 | Chennai   | rahul@gmail.com |
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      5 | Kiran    |   30 | Sales      | 50000.00 | Hyderabad | NULL            |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
|      7 | Divya    |   27 | HR         | 48000.00 | Chennai   | divya@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
6 rows in set (0.04 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE emp_name LIKE 'A%';
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
2 rows in set (0.02 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE emp_name LIKE '%a';
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      1 | Priya    |   22 | IT         | 45000.00 | Hyderabad | priya@gmail.com |
|      4 | Sneha    |   25 | Finance    | 60000.00 | Bangalore | sneha@gmail.com |
|      7 | Divya    |   27 | HR         | 48000.00 | Chennai   | divya@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
3 rows in set (0.00 sec)

mysql> ^C
mysql> SELECT *
    -> FROM employee_filter
    -> WHERE emp_name LIKE '%n%';
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL            |
|      4 | Sneha    |   25 | Finance    | 60000.00 | Bangalore | sneha@gmail.com |
|      5 | Kiran    |   30 | Sales      | 50000.00 | Hyderabad | NULL            |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE email IS NULL;
+--------+----------+------+------------+----------+-----------+-------+
| emp_id | emp_name | age  | department | salary   | city      | email |
+--------+----------+------+------------+----------+-----------+-------+
|      3 | Anil     |   35 | IT         | 75000.00 | Hyderabad | NULL  |
|      5 | Kiran    |   30 | Sales      | 50000.00 | Hyderabad | NULL  |
+--------+----------+------+------------+----------+-----------+-------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employee_filter
    -> WHERE email IS NOT NULL;
+--------+----------+------+------------+----------+-----------+-----------------+
| emp_id | emp_name | age  | department | salary   | city      | email           |
+--------+----------+------+------------+----------+-----------+-----------------+
|      1 | Priya    |   22 | IT         | 45000.00 | Hyderabad | priya@gmail.com |
|      2 | Rahul    |   28 | HR         | 55000.00 | Chennai   | rahul@gmail.com |
|      4 | Sneha    |   25 | Finance    | 60000.00 | Bangalore | sneha@gmail.com |
|      6 | Arjun    |   40 | IT         | 90000.00 | Mumbai    | arjun@gmail.com |
|      7 | Divya    |   27 | HR         | 48000.00 | Chennai   | divya@gmail.com |
+--------+----------+------+------------+----------+-----------+-----------------+
5 rows in set (0.00 sec)