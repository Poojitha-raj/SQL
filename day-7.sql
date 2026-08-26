mysql> CREATE TABLE customers (
    ->     customer_id INT,
    ->     customer_name VARCHAR(50),
    ->     city VARCHAR(50),
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> INSERT INTO customers
    -> VALUES
    -> (1, 'Priya Sharma', 'Hyderabad', 'priya@gmail.com'),
    -> (2, 'Rahul Kumar', 'Chennai', 'rahul@gmail.com'),
    -> (3, 'Anil Reddy', 'Bangalore', 'anil@gmail.com'),
    -> (4, 'Sneha Rao', 'Mumbai', 'sneha@gmail.com');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT CONCAT(customer_name, ' - ', city)
    -> FROM customers;
+------------------------------------+
| CONCAT(customer_name, ' - ', city) |
+------------------------------------+
| Priya Sharma - Hyderabad           |
| Rahul Kumar - Chennai              |
| Anil Reddy - Bangalore             |
| Sneha Rao - Mumbai                 |
+------------------------------------+
4 rows in set (0.00 sec)

mysql> SELECT UPPER(customer_name)
    -> FROM customers;
+----------------------+
| UPPER(customer_name) |
+----------------------+
| PRIYA SHARMA         |
| RAHUL KUMAR          |
| ANIL REDDY           |
| SNEHA RAO            |
+----------------------+
4 rows in set (0.00 sec)

mysql> SELECT LOWER(customer_name)
    -> FROM customers;
+----------------------+
| LOWER(customer_name) |
+----------------------+
| priya sharma         |
| rahul kumar          |
| anil reddy           |
| sneha rao            |
+----------------------+
4 rows in set (0.00 sec)

mysql> SELECT customer_name, LENGTH(customer_name)
    -> FROM customers;
+---------------+-----------------------+
| customer_name | LENGTH(customer_name) |
+---------------+-----------------------+
| Priya Sharma  |                    12 |
| Rahul Kumar   |                    11 |
| Anil Reddy    |                    10 |
| Sneha Rao     |                     9 |
+---------------+-----------------------+
4 rows in set (0.00 sec)

mysql> SELECT TRIM('   Hello   ');
+---------------------+
| TRIM('   Hello   ') |
+---------------------+
| Hello               |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING(customer_name, 1, 5)
    -> FROM customers;
+--------------------------------+
| SUBSTRING(customer_name, 1, 5) |
+--------------------------------+
| Priya                          |
| Rahul                          |
| Anil                           |
| Sneha                          |
+--------------------------------+
4 rows in set (0.00 sec)

mysql> SELECT LEFT(customer_name, 5)
    -> FROM customers;
+------------------------+
| LEFT(customer_name, 5) |
+------------------------+
| Priya                  |
| Rahul                  |
| Anil                   |
| Sneha                  |
+------------------------+
4 rows in set (0.00 sec)

mysql> SELECT RIGHT(customer_name, 5)
    -> FROM customers;
+-------------------------+
| RIGHT(customer_name, 5) |
+-------------------------+
| harma                   |
| Kumar                   |
| Reddy                   |
| a Rao                   |
+-------------------------+
4 rows in set (0.00 sec)

mysql> SELECT RIGHT(customer_name, 5)
    -> FROM customers;
+-------------------------+
| RIGHT(customer_name, 5) |
+-------------------------+
| harma                   |
| Kumar                   |
| Reddy                   |
| a Rao                   |
+-------------------------+
4 rows in set (0.00 sec)

mysql> SELECT REPLACE(city, 'Hyderabad', 'HYD')
    -> FROM customers;
+-----------------------------------+
| REPLACE(city, 'Hyderabad', 'HYD') |
+-----------------------------------+
| HYD                               |
| Chennai                           |
| Bangalore                         |
| Mumbai                            |
+-----------------------------------+
4 rows in set (0.00 sec)

mysql> SELECT LPAD(customer_id, 5, '0')
    -> FROM customers;
+---------------------------+
| LPAD(customer_id, 5, '0') |
+---------------------------+
| 00001                     |
| 00002                     |
| 00003                     |
| 00004                     |
+---------------------------+
4 rows in set (0.00 sec)

mysql> SELECT RPAD(customer_id, 5, '0')
    -> FROM customers;
+---------------------------+
| RPAD(customer_id, 5, '0') |
+---------------------------+
| 10000                     |
| 20000                     |
| 30000                     |
| 40000                     |
+---------------------------+
4 rows in set (0.00 sec)
