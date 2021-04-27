DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;

CREATE TABLE department(
id INTEGER AUTO_INCREMENT NOT NULL,
name VARCHAR(30) NULL,
PRIMARY KEY (id)
);

CREATE TABLE roles(
id INTEGER AUTO_INCREMENT NOT NULL,
title VARCHAR(30) NULL,
salary INTEGER (30) NULL,
department_id INTEGER NULL,
PRIMARY KEY (id) 
);

CREATE TABLE employee(
id INTEGER AUTO_INCREMENT NOT NULL,
first_name VARCHAR(30) NULL,
last_name VARCHAR (30) NULL,
role_id INTEGER NULL,
manager_id INTEGER NULL,
PRIMARY KEY (id) 
);

INSERT INTO department (name)
VALUES ("Sales"), ("Finance"), ("Engineering"), ("Legal");

INSERT INTO roles (title, salary, department_id)
VALUES ("Marketing Manager", 120000, 1), 
("Front End Developer", 120000, 3), 
("Underwriter", 120000, 4), 
("Accountant", 120000, 2),
("Account Exectutive", 120000, 1), 
("Software Engineer", 120000, 3), 
("Attorney", 120000, 4), 
("Book Keeper", 120000, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES 
("Patrick", "Ly",6, NULL),
("Pierre", "Bourbonais", 1, NULL),
("Nancy", "Murphy", 4, NULL),
("Matia", "Marks", 3, NULL),
("Lauren", "Friedman", 5, NULL),
("Jacqueline", "Nguyen", 2, NULL),
("Mark", "Fiore", 7, NULL),
("Teresa", "Knight", 8, NULL);
