DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employeess_db;
USE employees_db;

CREATE TABLE department(
id INTEGER NOT NULL,
name VARCHAR(30) NULL,
PRIMARY KEY (id)
);

CREATE TABLE role(
id INTEGER NOT NULL,
title VARCHAR(30) NULL,
salary INTEGER (30) NULL,
department_id INTEGER NULL,
PRIMARY KEY (id) 
);