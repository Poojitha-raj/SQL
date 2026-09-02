Enter password: *****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use da22;
Database changed
mysql> CREATE TABLE Department (
    ->     department_id INT PRIMARY KEY,
    ->     department_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Employee (
    ->     employee_id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     salary DECIMAL(10,2),
    ->     experience INT,
    ->     department_id INT,
    ->     FOREIGN KEY (department_id) REFERENCES Department(department_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update employee set salary = salary + 5000 where employee_id = 101;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from employee where employee_id = 101;
Empty set (0.00 sec)

mysql> INSERT INTO Department (department_id, department_name) VALUES
    -> (1, 'IT'),
    -> (2, 'HR'),
    -> (3, 'Finance'),
    -> (4, 'Marketing');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Employee (employee_id, name, salary, experience, department_id) VALUES
    -> (101, 'Rahul', 60000, 5, 1),
    -> (102, 'Kiran', 45000, 3, 1),
    -> (103, 'Anita', 55000, 4, 2),
    -> (104, 'Priya', 70000, 6, 3),
    -> (105, 'Sneha', 40000, 2, 2),
    -> (106, 'Vijay', 65000, 5, 3),
    -> (107, 'Ajay', 50000, 3, 4),
    -> (108, 'Ravi', 75000, 7, 1),
    -> (109, 'Meena', 48000, 2, 4),
    -> (110, 'Arun', 58000, 4, 3);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 60000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update employee set salary = salary + 5000 where employee_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> commit;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from employee where employee_id = 101;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 65000.00 |          5 |             1 |
+-------------+-------+----------+------------+---------------+
1 row in set (0.00 sec)

mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 65000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> start transaction ;
Query OK, 0 rows affected (0.00 sec)

mysql> update employee set salary = salary * 1.10 where employee_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> rollback;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 65000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update employee set salary = salary - 5000 where employee_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set salary = salary - 5000 where employee _id = 102;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '_id = 102' at line 1
mysql> start transaction;
Query OK, 0 rows affected (0.04 sec)

mysql> update employee set salary = salary - 5000 where employee _id = 102;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '_id = 102' at line 1
mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 60000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update emplyee set salary = salary + 5000 where employee_id = 101;
ERROR 1146 (42S02): Table 'da22.emplyee' doesn't exist
mysql> savepoint first_update;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 60000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> update employee set salary = salary + 3000 where employee_id = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> rollback to savepoint first_update;\
Query OK, 0 rows affected (0.01 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET salary = salary + 5000
    -> WHERE employee_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SAVEPOINT first_savepoint;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> UPDATE Employee
    -> SET salary = salary + 3000
    -> WHERE employee_id = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SAVEPOINT second_savepoint;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> ROLLBACK TO SAVEPOINT first_savepoint;
Query OK, 0 rows affected (0.00 sec)

mysql> selct * from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selct * from employee' at line 1
mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 65000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> set autocommit = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> update employee set salary = salary + 5000 where employee_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> commit;
Query OK, 0 rows affected (0.04 sec)

mysql> selct * from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selct * from employee' at line 1
mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 70000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql> set autocommit = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> update employee set salary = salary + 5000 where employee_id = 102 ;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> rollback;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from employee;
+-------------+-------+----------+------------+---------------+
| employee_id | name  | salary   | experience | department_id |
+-------------+-------+----------+------------+---------------+
|         101 | Rahul | 70000.00 |          5 |             1 |
|         102 | Kiran | 45000.00 |          3 |             1 |
|         103 | Anita | 55000.00 |          4 |             2 |
|         104 | Priya | 70000.00 |          6 |             3 |
|         105 | Sneha | 40000.00 |          2 |             2 |
|         106 | Vijay | 65000.00 |          5 |             3 |
|         107 | Ajay  | 50000.00 |          3 |             4 |
|         108 | Ravi  | 75000.00 |          7 |             1 |
|         109 | Meena | 48000.00 |          2 |             4 |
|         110 | Arun  | 58000.00 |          4 |             3 |
+-------------+-------+----------+------------+---------------+
10 rows in set (0.00 sec)

mysql>

