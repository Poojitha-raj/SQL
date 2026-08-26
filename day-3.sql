mysql> CREATE TABLE employee (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO employees
    -> VALUES (1, 'Priya');
ERROR 1146 (42S02): Table 'sql_20_days.employees' doesn't exist
mysql>
mysql> INSERT INTO employees
    -> VALUES (2, 'Rahul');
ERROR 1146 (42S02): Table 'sql_20_days.employees' doesn't exist
mysql>
mysql> INSERT INTO employee
    -> VALUES (1, 'Priya');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO employee
    -> VALUES (2, 'Rahul');
Query OK, 1 row affected (0.03 sec)

mysql> CREATE TABLE employee_details (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO employee_details
    -> VALUES (1, 'Priya');
Query OK, 1 row affected (0.01 sec)

mysql> CREATE TABLE users (
    ->     user_id INT PRIMARY KEY,
    ->     username VARCHAR(50) UNIQUE
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>
mysql> INSERT INTO users
    -> VALUES (1, 'priya');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO users
    -> VALUES (2, 'rahul');
Query OK, 1 row affected (0.02 sec)

mysql> CREATE TABLE employee_status (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     status VARCHAR(20) DEFAULT 'Active'
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>
mysql> INSERT INTO employee_status (emp_id, emp_name)
    -> VALUES (1, 'Priya');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM employee_status;CREATE TABLE employee_age (
+--------+----------+--------+
| emp_id | emp_name | status |
+--------+----------+--------+
|      1 | Priya    | Active |
+--------+----------+--------+
1 row in set (0.00 sec)

    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     age INT CHECK (age >= 18)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> INSERT INTO employee_age
    -> VALUES (1, 'Priya', 22);
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> SELECT *
    -> FROM employee_age;
+--------+----------+------+
| emp_id | emp_name | age  |
+--------+----------+------+
|      1 | Priya    |   22 |
+--------+----------+------+
1 row in set (0.00 sec)

mysql> CREATE TABLE department (
    ->     dept_id INT PRIMARY KEY,
    ->     dept_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> INSERT INTO department
    -> VALUES (1, 'IT');
Query OK, 1 row affected (0.01 sec)

mysql>
mysql> INSERT INTO department
    -> VALUES (2, 'HR');
Query OK, 1 row affected (0.01 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | NO   | PRI | NULL    |       |
| emp_name | varchar(50) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)