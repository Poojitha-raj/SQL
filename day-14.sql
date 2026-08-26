mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| citizenfix         |
| companydb          |
| da22               |
| films              |
| information_schema |
| movies             |
| mysql              |
| performance_schema |
| sql_20_days        |
| student            |
| sys                |
| version            |
+--------------------+
12 rows in set (0.06 sec)

mysql> use da22;
Database changed
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

mysql> select e.emp_name,m.manager_id from employee e
    -> join employee m
    -> on e.manager_id = m.emp_id;
+----------+------------+
| emp_name | manager_id |
+----------+------------+
| Rahul    |       NULL |
| Sneha    |       NULL |
| Kiran    |       NULL |
| Anjali   |       NULL |
| Ravi     |       NULL |
| Meena    |       NULL |
| Suresh   |       NULL |
| Divya    |       NULL |
| Vikas    |       NULL |
| Pooja    |       NULL |
+----------+------------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> join employee m
    -> on e.manager_id = m.emp_id;
+----------+------------+
| emp_name | manager_id |
+----------+------------+
| Rahul    |        105 |
| Sneha    |        105 |
| Kiran    |        105 |
| Anjali   |        106 |
| Ravi     |        106 |
| Meena    |        105 |
| Suresh   |        106 |
| Divya    |        105 |
| Vikas    |        106 |
| Pooja    |        105 |
+----------+------------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,m.manager_id from employee e
    ->
    -> left join employee m
    -> on e.manager_id = m.emp_id;
+----------+------------+
| emp_name | manager_id |
+----------+------------+
| Rahul    |       NULL |
| Sneha    |       NULL |
| Kiran    |       NULL |
| Anjali   |       NULL |
| Amit     |       NULL |
| Priya    |       NULL |
| Ravi     |       NULL |
| Meena    |       NULL |
| Suresh   |       NULL |
| Divya    |       NULL |
| Vikas    |       NULL |
| Pooja    |       NULL |
+----------+------------+
12 rows in set (0.00 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> left join employee m
    -> on e.manager_id = m.emp_id;
+----------+------------+
| emp_name | manager_id |
+----------+------------+
| Rahul    |        105 |
| Sneha    |        105 |
| Kiran    |        105 |
| Anjali   |        106 |
| Amit     |       NULL |
| Priya    |       NULL |
| Ravi     |        106 |
| Meena    |        105 |
| Suresh   |        106 |
| Divya    |        105 |
| Vikas    |        106 |
| Pooja    |        105 |
+----------+------------+
12 rows in set (0.00 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> right join employee m
    -> on e.manager_id = m.emp_id;
+----------+------------+
| emp_name | manager_id |
+----------+------------+
| NULL     |       NULL |
| NULL     |       NULL |
| NULL     |       NULL |
| NULL     |       NULL |
| Pooja    |        105 |
| Divya    |        105 |
| Meena    |        105 |
| Kiran    |        105 |
| Sneha    |        105 |
| Rahul    |        105 |
| Vikas    |        106 |
| Suresh   |        106 |
| Ravi     |        106 |
| Anjali   |        106 |
| NULL     |       NULL |
| NULL     |       NULL |
| NULL     |       NULL |
| NULL     |       NULL |
| NULL     |       NULL |
| NULL     |       NULL |
+----------+------------+
20 rows in set (0.00 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> inner join employee m
    -> on e.manager_id = m.emp_id;
+----------+------------+
| emp_name | manager_id |
+----------+------------+
| Rahul    |        105 |
| Sneha    |        105 |
| Kiran    |        105 |
| Anjali   |        106 |
| Ravi     |        106 |
| Meena    |        105 |
| Suresh   |        106 |
| Divya    |        105 |
| Vikas    |        106 |
| Pooja    |        105 |
+----------+------------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> inner join employee^C
mysql>
mysql> select distinct e.manager_id from employee;
ERROR 1054 (42S22): Unknown column 'e.manager_id' in 'field list'
mysql> select distinct manager_id from employee;
+------------+
| manager_id |
+------------+
|        105 |
|        106 |
|       NULL |
+------------+
3 rows in set (0.04 sec)

mysql> select distinct manager_id from employee manager_id i not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'i not null' at line 1
mysql> select distinct manager_id from employee where manager_id i not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'i not null' at line 1
mysql> select distinct manager_id from employee where manager_id is not null;
+------------+
| manager_id |
+------------+
|        105 |
|        106 |
+------------+
2 rows in set (0.00 sec)

mysql> select e.*,d.* from employee e join department
    -> on e.dept_id = d.dept_id;
ERROR 1051 (42S02): Unknown table 'd'
mysql> select e.*,d.* from employee e join department d
    -> on e.dept_id = d.dept_id;
+--------+----------+----------+--------+---------+------------+---------+-----------+-----------+
| emp_id | emp_name | salary   | gender | dept_id | manager_id | dept_id | dept_name | location  |
+--------+----------+----------+--------+---------+------------+---------+-----------+-----------+
|    101 | Rahul    | 50000.00 | Male   |      20 |        105 |      20 | IT        | Bangalore |
|    102 | Sneha    | 45000.00 | Female |      10 |        105 |      10 | HR        | Hyderabad |
|    103 | Kiran    | 60000.00 | Male   |      20 |        105 |      20 | IT        | Bangalore |
|    104 | Anjali   | 55000.00 | Female |      30 |        106 |      30 | Finance   | Chennai   |
|    105 | Amit     | 90000.00 | Male   |      20 |       NULL |      20 | IT        | Bangalore |
|    106 | Priya    | 85000.00 | Female |      40 |       NULL |      40 | Sales     | Mumbai    |
|    107 | Ravi     | 40000.00 | Male   |      50 |        106 |      50 | Marketing | Pune      |
|    110 | Divya    | 62000.00 | Female |      20 |        105 |      20 | IT        | Bangalore |
|    111 | Vikas    | 38000.00 | Male   |      60 |        106 |      60 | Support   | Delhi     |
|    112 | Pooja    | 46000.00 | Female |      10 |        105 |      10 | HR        | Hyderabad |
+--------+----------+----------+--------+---------+------------+---------+-----------+-----------+
10 rows in set (0.00 sec)

mysql> select e.emp_name,d.dept_name,e.salary from employee e
    -> join department d on e.dept_id = d.dept_id
    -> where e.salary > 50000;
+----------+-----------+----------+
| emp_name | dept_name | salary   |
+----------+-----------+----------+
| Kiran    | IT        | 60000.00 |
| Anjali   | Finance   | 55000.00 |
| Amit     | IT        | 90000.00 |
| Priya    | Sales     | 85000.00 |
| Divya    | IT        | 62000.00 |
+----------+-----------+----------+
5 rows in set (0.07 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> join department d
    -> on e.emp_name = e.manager_id;
Empty set, 12 warnings (0.03 sec)

mysql> select e.emp_name,e.manager_id from employee e
    -> join department d
    -> on e.emp_name = d.manager_id;
ERROR 1054 (42S22): Unknown column 'd.manager_id' in 'on clause'
mysql> select e.emp_name,m.manager_name from employee e
    -> join department m
    -> on e.emp_name = e.manager_id;
ERROR 1054 (42S22): Unknown column 'm.manager_name' in 'field list'
mysql> select e.*,d.dept_name from employee e join
    -> department d on e.dept_id=d.dept_id
    -> where e.salary between 45000 and 70000;
+--------+----------+----------+--------+---------+------------+-----------+
| emp_id | emp_name | salary   | gender | dept_id | manager_id | dept_name |
+--------+----------+----------+--------+---------+------------+-----------+
|    101 | Rahul    | 50000.00 | Male   |      20 |        105 | IT        |
|    102 | Sneha    | 45000.00 | Female |      10 |        105 | HR        |
|    103 | Kiran    | 60000.00 | Male   |      20 |        105 | IT        |
|    104 | Anjali   | 55000.00 | Female |      30 |        106 | Finance   |
|    110 | Divya    | 62000.00 | Female |      20 |        105 | IT        |
|    112 | Pooja    | 46000.00 | Female |      10 |        105 | HR        |
+--------+----------+----------+--------+---------+------------+-----------+
6 rows in set (0.00 sec)

mysql> select e.emp_name,e.salary,d.dept_name
    -> from employee e
    -> join department d
    -> on e.department_id = d.department_id
    -> where salary e.salary > 50000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e.salary > 50000' at line 5
mysql>








