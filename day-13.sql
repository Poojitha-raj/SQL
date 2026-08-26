
mysql> use da22;
Database changed
mysql> show tables;
+----------------+
| Tables_in_da22 |
+----------------+
| department     |
| dept           |
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
12 rows in set (0.07 sec)

mysql> drop department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'department' at line 1
mysql> drop table department;
Query OK, 0 rows affected (0.06 sec)

mysql> drop table employee;
ERROR 3730 (HY000): Cannot drop table 'employee' referenced by a foreign key constraint 'dept_ibfk_1' on table 'dept'.
mysql> DROP TABLE dept;
Query OK, 0 rows affected (0.10 sec)

mysql> DROP TABLE employee;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE department (
    ->     dept_id INT PRIMARY KEY,
    ->     dept_name VARCHAR(50),
    ->     location VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql>
mysql> INSERT INTO department VALUES
    -> (10,'HR','Hyderabad'),
    -> (20,'IT','Bangalore'),
    -> (30,'Finance','Chennai'),
    -> (40,'Sales','Mumbai'),
    -> (50,'Marketing','Pune'),
    -> (60,'Support','Delhi'),
    -> (70,'Testing','Kolkata');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE employee (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     salary DECIMAL(10,2),
    ->     gender VARCHAR(10),
    ->     dept_id INT,
    ->     manager_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO employee VALUES
    -> (101,'Rahul',50000,'Male',20,105),
    -> (102,'Sneha',45000,'Female',10,105),
    -> (103,'Kiran',60000,'Male',20,105),
    -> (104,'Anjali',55000,'Female',30,106),
    -> (105,'Amit',90000,'Male',20,NULL),
    -> (106,'Priya',85000,'Female',40,NULL),
    -> (107,'Ravi',40000,'Male',50,106),
    -> (108,'Meena',70000,'Female',NULL,105),
    -> (109,'Suresh',48000,'Male',80,106),
    -> (110,'Divya',62000,'Female',20,105),
    -> (111,'Vikas',38000,'Male',60,106),
    -> (112,'Pooja',46000,'Female',10,105);
Query OK, 12 rows affected (0.03 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql>
mysql> select * from employee;
+--------+----------+----------+--------+---------+------------+
| emp_id | emp_name | salary   | gender | dept_id | manager_id |
+--------+----------+----------+--------+---------+------------+
|    101 | Rahul    | 50000.00 | Male   |      20 |        105 |
|    102 | Sneha    | 45000.00 | Female |      10 |        105 |
|    103 | Kiran    | 60000.00 | Male   |      20 |        105 |
|    104 | Anjali   | 55000.00 | Female |      30 |        106 |
|    105 | Amit     | 90000.00 | Male   |      20 |       NULL |
|    106 | Priya    | 85000.00 | Female |      40 |       NULL |
|    107 | Ravi     | 40000.00 | Male   |      50 |        106 |
|    108 | Meena    | 70000.00 | Female |    NULL |        105 |
|    109 | Suresh   | 48000.00 | Male   |      80 |        106 |
|    110 | Divya    | 62000.00 | Female |      20 |        105 |
|    111 | Vikas    | 38000.00 | Male   |      60 |        106 |
|    112 | Pooja    | 46000.00 | Female |      10 |        105 |
+--------+----------+----------+--------+---------+------------+
12 rows in set (0.00 sec)

mysql> select * from department;
+---------+-----------+-----------+
| dept_id | dept_name | location  |
+---------+-----------+-----------+
|      10 | HR        | Hyderabad |
|      20 | IT        | Bangalore |
|      30 | Finance   | Chennai   |
|      40 | Sales     | Mumbai    |
|      50 | Marketing | Pune      |
|      60 | Support   | Delhi     |
|      70 | Testing   | Kolkata   |
+---------+-----------+-----------+
7 rows in set (0.00 sec)

mysql> select e.*,dept_name from employee e
    -> left join department d
    -> on e.dept_id = d.dept_id;
+--------+----------+----------+--------+---------+------------+-----------+
| emp_id | emp_name | salary   | gender | dept_id | manager_id | dept_name |
+--------+----------+----------+--------+---------+------------+-----------+
|    101 | Rahul    | 50000.00 | Male   |      20 |        105 | IT        |
|    102 | Sneha    | 45000.00 | Female |      10 |        105 | HR        |
|    103 | Kiran    | 60000.00 | Male   |      20 |        105 | IT        |
|    104 | Anjali   | 55000.00 | Female |      30 |        106 | Finance   |
|    105 | Amit     | 90000.00 | Male   |      20 |       NULL | IT        |
|    106 | Priya    | 85000.00 | Female |      40 |       NULL | Sales     |
|    107 | Ravi     | 40000.00 | Male   |      50 |        106 | Marketing |
|    108 | Meena    | 70000.00 | Female |    NULL |        105 | NULL      |
|    109 | Suresh   | 48000.00 | Male   |      80 |        106 | NULL      |
|    110 | Divya    | 62000.00 | Female |      20 |        105 | IT        |
|    111 | Vikas    | 38000.00 | Male   |      60 |        106 | Support   |
|    112 | Pooja    | 46000.00 | Female |      10 |        105 | HR        |
+--------+----------+----------+--------+---------+------------+-----------+
12 rows in set (0.04 sec)

mysql> select d.*,emp_name from department d
    -> left join employee e
    -> on d.emp_name = e.dept_id;
ERROR 1054 (42S22): Unknown column 'd.emp_name' in 'on clause'
mysql> select d.*,emp_name from department d
    -> left join employee e
    -> on d.dept_id = e.dept_id;
+---------+-----------+-----------+----------+
| dept_id | dept_name | location  | emp_name |
+---------+-----------+-----------+----------+
|      10 | HR        | Hyderabad | Pooja    |
|      10 | HR        | Hyderabad | Sneha    |
|      20 | IT        | Bangalore | Divya    |
|      20 | IT        | Bangalore | Amit     |
|      20 | IT        | Bangalore | Kiran    |
|      20 | IT        | Bangalore | Rahul    |
|      30 | Finance   | Chennai   | Anjali   |
|      40 | Sales     | Mumbai    | Priya    |
|      50 | Marketing | Pune      | Ravi     |
|      60 | Support   | Delhi     | Vikas    |
|      70 | Testing   | Kolkata   | NULL     |
+---------+-----------+-----------+----------+
11 rows in set (0.04 sec)

mysql> select e.emp_name,d.dept_name from employee e
    -> inner join department d
    -> on e.dpt_id-d.dept_id;
ERROR 1054 (42S22): Unknown column 'e.dpt_id' in 'on clause'
mysql> select e.emp_name,d.dept_name from employee e
    -> inner join department d
    -> on e.dept_id-d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Rahul    | Testing   |
| Rahul    | Support   |
| Rahul    | Marketing |
| Rahul    | Sales     |
| Rahul    | Finance   |
| Rahul    | HR        |
| Sneha    | Testing   |
| Sneha    | Support   |
| Sneha    | Marketing |
| Sneha    | Sales     |
| Sneha    | Finance   |
| Sneha    | IT        |
| Kiran    | Testing   |
| Kiran    | Support   |
| Kiran    | Marketing |
| Kiran    | Sales     |
| Kiran    | Finance   |
| Kiran    | HR        |
| Anjali   | Testing   |
| Anjali   | Support   |
| Anjali   | Marketing |
| Anjali   | Sales     |
| Anjali   | IT        |
| Anjali   | HR        |
| Amit     | Testing   |
| Amit     | Support   |
| Amit     | Marketing |
| Amit     | Sales     |
| Amit     | Finance   |
| Amit     | HR        |
| Priya    | Testing   |
| Priya    | Support   |
| Priya    | Marketing |
| Priya    | Finance   |
| Priya    | IT        |
| Priya    | HR        |
| Ravi     | Testing   |
| Ravi     | Support   |
| Ravi     | Sales     |
| Ravi     | Finance   |
| Ravi     | IT        |
| Ravi     | HR        |
| Suresh   | Testing   |
| Suresh   | Support   |
| Suresh   | Marketing |
| Suresh   | Sales     |
| Suresh   | Finance   |
| Suresh   | IT        |
| Suresh   | HR        |
| Divya    | Testing   |
| Divya    | Support   |
| Divya    | Marketing |
| Divya    | Sales     |
| Divya    | Finance   |
| Divya    | HR        |
| Vikas    | Testing   |
| Vikas    | Marketing |
| Vikas    | Sales     |
| Vikas    | Finance   |
| Vikas    | IT        |
| Vikas    | HR        |
| Pooja    | Testing   |
| Pooja    | Support   |
| Pooja    | Marketing |
| Pooja    | Sales     |
| Pooja    | Finance   |
| Pooja    | IT        |
+----------+-----------+
67 rows in set (0.04 sec)

mysql> select e.emp_name,d.dept_name from employee e
    -> inner join department d
    -> on e.dept_id=d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Rahul    | IT        |
| Sneha    | HR        |
| Kiran    | IT        |
| Anjali   | Finance   |
| Amit     | IT        |
| Priya    | Sales     |
| Ravi     | Marketing |
| Divya    | IT        |
| Vikas    | Support   |
| Pooja    | HR        |
+----------+-----------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,d.dept_name from employee e
    -> inner join department d
    -> on e.dept_id=d.dept_id
    -> where d.dept_name in('IT','Finance');
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Rahul    | IT        |
| Kiran    | IT        |
| Anjali   | Finance   |
| Amit     | IT        |
| Divya    | IT        |
+----------+-----------+
5 rows in set (0.00 sec)

mysql> slect emp_name from employee
    -> union all
    -> select dept_name from employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'slect emp_name from employee
union all
select dept_name from employee' at line 1
mysql> slect emp_name from employee
    -> union all
    -> select dept_name from department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'slect emp_name from employee
union all
select dept_name from department' at line 1
mysql> select emp_name from employee
    -> union all
    -> select dept_name from employee;
ERROR 1054 (42S22): Unknown column 'dept_name' in 'field list'
mysql> select emp_name from employee
    -> union all
    -> select dept_name from department;
+-----------+
| emp_name  |
+-----------+
| Rahul     |
| Sneha     |
| Kiran     |
| Anjali    |
| Amit      |
| Priya     |
| Ravi      |
| Meena     |
| Suresh    |
| Divya     |
| Vikas     |
| Pooja     |
| HR        |
| IT        |
| Finance   |
| Sales     |
| Marketing |
| Support   |
| Testing   |
+-----------+
19 rows in set (0.04 sec)

mysql> select d.dept_id from department d
    -> left join employee e on
    -> d.dept_id -e.dept_id
    -> where e.dept_id is null;
Empty set (0.00 sec)

mysql> select d.dept_id from department d
    -> left join employee e on
    -> d.dept_id =e.dept_id
    -> where e.dept_id is null;
+---------+
| dept_id |
+---------+
|      70 |
+---------+
1 row in set (0.00 sec)

mysql> select e.emp_name,d.dept_id from employee e
    -> inner join department d
    -> on d.dept_id = e.dept_id;
+----------+---------+
| emp_name | dept_id |
+----------+---------+
| Rahul    |      20 |
| Sneha    |      10 |
| Kiran    |      20 |
| Anjali   |      30 |
| Amit     |      20 |
| Priya    |      40 |
| Ravi     |      50 |
| Divya    |      20 |
| Vikas    |      60 |
| Pooja    |      10 |
+----------+---------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,e.salary,d.dept_name,d.location
    -> from employee e left join department d
    -> on e.dept_id = d.dept_id;
+----------+----------+-----------+-----------+
| emp_name | salary   | dept_name | location  |
+----------+----------+-----------+-----------+
| Rahul    | 50000.00 | IT        | Bangalore |
| Sneha    | 45000.00 | HR        | Hyderabad |
| Kiran    | 60000.00 | IT        | Bangalore |
| Anjali   | 55000.00 | Finance   | Chennai   |
| Amit     | 90000.00 | IT        | Bangalore |
| Priya    | 85000.00 | Sales     | Mumbai    |
| Ravi     | 40000.00 | Marketing | Pune      |
| Meena    | 70000.00 | NULL      | NULL      |
| Suresh   | 48000.00 | NULL      | NULL      |
| Divya    | 62000.00 | IT        | Bangalore |
| Vikas    | 38000.00 | Support   | Delhi     |
| Pooja    | 46000.00 | HR        | Hyderabad |
+----------+----------+-----------+-----------+
12 rows in set (0.03 sec)

mysql> select e.emp_name from employee e
    -> ^C
mysql> SELECT e.emp_name
    -> FROM employee e
    -> JOIN department d
    -> ON e.dept_id = d.dept_id
    -> WHERE d.location IN ('Hyderabad', 'Bangalore', 'Chennai');
+----------+
| emp_name |
+----------+
| Rahul    |
| Sneha    |
| Kiran    |
| Anjali   |
| Amit     |
| Divya    |
| Pooja    |
+----------+
7 rows in set (0.00 sec)

mysql> select e.emp_name e
    -> from employee e
    -> join department d
    -> on e.dept_id = d.dept_id
    -> where d.location IN('Hyderabad','Bangalore','Chennai');
+--------+
| e      |
+--------+
| Rahul  |
| Sneha  |
| Kiran  |
| Anjali |
| Amit   |
| Divya  |
| Pooja  |
+--------+
7 rows in set (0.00 sec)
mysql> select e.emp_name,d.dept_name from employee e
    -> inner join department d
    -> on e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Rahul    | IT        |
| Sneha    | HR        |
| Kiran    | IT        |
| Anjali   | Finance   |
| Amit     | IT        |
| Priya    | Sales     |
| Ravi     | Marketing |
| Divya    | IT        |
| Vikas    | Support   |
| Pooja    | HR        |
+----------+-----------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,d.dept_name from employee e
    ->  join department d
    -> on e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Rahul    | IT        |
| Sneha    | HR        |
| Kiran    | IT        |
| Anjali   | Finance   |
| Amit     | IT        |
| Priya    | Sales     |
| Ravi     | Marketing |
| Divya    | IT        |
| Vikas    | Support   |
| Pooja    | HR        |
+----------+-----------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,e.emp_id ,dept_location from employee e
    -> join department d
    -> on e.dept_id = d.dept_id;
ERROR 1054 (42S22): Unknown column 'dept_location' in 'field list'
mysql> select e.emp_name,e.emp_id ,d.location from employee e
    -> join department d
    -> on e.dept_id = d.dept_id;
+----------+--------+-----------+
| emp_name | emp_id | location  |
+----------+--------+-----------+
| Rahul    |    101 | Bangalore |
| Sneha    |    102 | Hyderabad |
| Kiran    |    103 | Bangalore |
| Anjali   |    104 | Chennai   |
| Amit     |    105 | Bangalore |
| Priya    |    106 | Mumbai    |
| Ravi     |    107 | Pune      |
| Divya    |    110 | Bangalore |
| Vikas    |    111 | Delhi     |
| Pooja    |    112 | Hyderabad |
+----------+--------+-----------+
10 rows in set (0.00 sec)