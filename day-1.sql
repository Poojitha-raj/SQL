-- 100 Days of SQL
-- Day 01: Database and Table Creation

CREATE DATABASE sql_100_days;

USE sql_100_days;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(30),
    job_role VARCHAR(30),
    salary DECIMAL(10,2),
    joining_date DATE
);

CREATE TABLE dept (
    dep_id INT,
    dep_name VARCHAR(20),
    location VARCHAR(30)
);

CREATE TABLE student (
    student_id INT,
    student_name VARCHAR(50),
    age INT,
    course VARCHAR(30)
);

SHOW DATABASES;

SHOW TABLES;

DESC employee;

DESC dept;

DESC student;