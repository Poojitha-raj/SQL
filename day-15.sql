mysql> use da22;
Database changed
mysql> show table employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'employee' at line 1
mysql> show employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'employee' at line 1
mysql> show tables;
+----------------+
| Tables_in_da22 |
+----------------+
| department     |
| dept1          |
| emp            |
| emp1           |
| employee       |
| employee2      |
| employees      |
| new_student    |
| old_student    |
| products       |
| student        |
+----------------+
11 rows in set (0.01 sec)

mysql> show table like 'employee';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'like 'employee'' at line 1
mysql> show tables like 'employee';
+---------------------------+
| Tables_in_da22 (employee) |
+---------------------------+
| employee                  |
+---------------------------+
1 row in set (0.00 sec)

mysql> desc employee;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| emp_id     | int           | NO   | PRI | NULL    |       |
| emp_name   | varchar(30)   | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
| dept_id    | int           | YES  | MUL | NULL    |       |
| experience | int           | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> show tables like 'department';
+-----------------------------+
| Tables_in_da22 (department) |
+-----------------------------+
| department                  |
+-----------------------------+
1 row in set (0.00 sec)

mysql> desc department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(30) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from employee where salary > (select salary from employee where emp_name = 'rahul';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> ^C
mysql> Find employees earning more than Rahul.
    -> Find employees earning less than Priya.
    -> Find employees working in the same department as Vijay.
    -> Find employees having the highest salary.
    -> Find employees having the lowest salary.
    -> ^C
mysql> SELECT *
    -> FROM Employee
    -> WHERE salary > (
    ->     SELECT salary
    ->     FROM Employee
    ->     WHERE emp_name = 'Rahul'
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    103 | Anita    | 65000.00 |      20 |          5 |
|    104 | Priya    | 70000.00 |      20 |          6 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
6 rows in set (0.00 sec)

mysql> select * from employee where salary < (select salary from employee where emp_name = 'priya'));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> select * from employee where salary < (select salary from employee where emp_name = 'priya');
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    102 | Kiran    | 45000.00 |      10 |          2 |
|    103 | Anita    | 65000.00 |      20 |          5 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
7 rows in set (0.04 sec)

mysql> select * from employee where dept_id = (select dept_id from employee where emp_name = 'vijay');
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
3 rows in set (0.00 sec)

mysql> select * from employee where salary = (select max(salary) from employee);
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    105 | Sneha    | 80000.00 |      20 |          8 |
+--------+----------+----------+---------+------------+
1 row in set (0.00 sec)

mysql> select * from employee where salary = (select min(salary) from employee );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
1 row in set (0.00 sec)

mysql> select emp_name from employee where emp_name in ('IT','HR');
Empty set (0.00 sec)

mysql> select * from employee where employee in('IT','HR');
ERROR 1054 (42S22): Unknown column 'employee' in 'where clause'
mysql> select * from employee where department in('IT','HR');
ERROR 1054 (42S22): Unknown column 'department' in 'where clause'
mysql> select * from employee where dept_id in('IT','HR');
Empty set, 2 warnings (0.00 sec)

mysql> select * from employee where dept_id in ('finance','sales');
Empty set, 2 warnings (0.00 sec)

mysql> SELECT *
    -> FROM Employee
    -> WHERE salary > ANY (
    ->     SELECT salary
    ->     FROM Employee
    ->     WHERE department = 'HR'
    -> );
ERROR 1054 (42S22): Unknown column 'department' in 'where clause'
mysql> SELECT *
    -> FROM Employee
    -> WHERE salary > ANY (
    ->     SELECT salary
    -> FROM Employee
    ->     WHERE dept_id = 'HR'
    -> );
Empty set, 1 warning (0.00 sec)
mysql> SELECT *
    -> FROM Employee
    -> WHERE dept_id IN (
    ->     SELECT dept_id
    ->     FROM Department
    ->     WHERE dept_name IN ('HR', 'IT')
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    102 | Kiran    | 45000.00 |      10 |          2 |
|    103 | Anita    | 65000.00 |      20 |          5 |
|    104 | Priya    | 70000.00 |      20 |          6 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
+--------+----------+----------+---------+------------+
5 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM Employee
    -> WHERE dept_id IN (
    ->     SELECT dept_id
    ->     FROM Department
    ->     WHERE dept_name IN ('Finance', 'Sales')
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
5 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary > ANY (
    ->     SELECT e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = 10
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    103 | Anita    | 65000.00 |      20 |          5 |
|    104 | Priya    | 70000.00 |      20 |          6 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
7 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary > ALL (
    ->     SELECT e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = 10
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    103 | Anita    | 65000.00 |      20 |          5 |
|    104 | Priya    | 70000.00 |      20 |          6 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
6 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary < ANY (
    ->     SELECT e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = 20
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    102 | Kiran    | 45000.00 |      10 |          2 |
|    103 | Anita    | 65000.00 |      20 |          5 |
|    104 | Priya    | 70000.00 |      20 |          6 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    109 | Meena    | 75000.00 |      40 |          7 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
9 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary < ALL (
    ->     SELECT e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = 20
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    102 | Kiran    | 45000.00 |      10 |          2 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
6 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary = ANY (
    ->     SELECT e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = 30
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
3 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE (e.dept_id, e.salary) = (
    ->     SELECT e2.dept_id, e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.emp_name = 'Rahul'
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
+--------+----------+----------+---------+------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.emp_id <> 101
    -> AND (e.dept_id, e.salary) = (
    ->     SELECT e2.dept_id, e2.salary
    ->     FROM Employee e2
    ->     WHERE e2.emp_name = 'Rahul'
    -> );
Empty set (0.00 sec)

mysql>
mysql> SELECT *
    -> FROM Employee e
    -> WHERE (e.dept_id, e.experience) = (
    ->     SELECT e2.dept_id, e2.experience
    ->     FROM Employee e2
    ->     WHERE e2.emp_name = 'Vijay'
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    106 | Vijay    | 55000.00 |      30 |          4 |
+--------+----------+----------+---------+------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE (e.salary, e.experience) = (
    ->     SELECT e2.salary, e2.experience
    ->     FROM Employee e2
    ->     WHERE e2.emp_name = 'Meena'
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE (e.dept_id, e.experience) = (
    ->     SELECT e2.dept_id, e2.experience
    ->     FROM Employee e2
    ->     WHERE e2.emp_name = 'Arun'
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary > (
    ->     SELECT AVG(e2.salary)
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = e.dept_id
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary < (
    ->     SELECT AVG(e2.salary)
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = e.dept_id
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    102 | Kiran    | 45000.00 |      10 |          2 |
|    103 | Anita    | 65000.00 |      20 |          5 |
|    104 | Priya    | 70000.00 |      20 |          6 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    108 | Ravi     | 40000.00 |      30 |          1 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
6 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary = (
    ->     SELECT MAX(e2.salary)
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = e.dept_id
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary = (
    ->     SELECT MIN(e2.salary)
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = e.dept_id
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    102 | Kiran    | 45000.00 |      10 |          2 |
|    103 | Anita    | 65000.00 |      20 |          5 |
|    107 | Ajay     | 60000.00 |      40 |          5 |
|    110 | Arun     | 35000.00 |      30 |          1 |
+--------+----------+----------+---------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.experience > (
    ->     SELECT AVG(e2.experience)
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = e.dept_id
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employee e
    -> WHERE e.salary = (
    ->     SELECT MAX(e2.salary)
    ->     FROM Employee e2
    ->     WHERE e2.dept_id = e.dept_id
    -> );
+--------+----------+----------+---------+------------+
| emp_id | emp_name | salary   | dept_id | experience |
+--------+----------+----------+---------+------------+
|    101 | Rahul    | 50000.00 |      10 |          3 |
|    105 | Sneha    | 80000.00 |      20 |          8 |
|    106 | Vijay    | 55000.00 |      30 |          4 |
|    109 | Meena    | 75000.00 |      40 |          7 |
+--------+----------+----------+---------+------------+
4 rows in set (0.00 sec)

mysql>