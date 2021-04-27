DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employeess_db;
USE employees_db;

CREATE TABLE department(
id INTEGER AUTO_INCREMENT NOT NULL,
name VARCHAR(30) NULL,
PRIMARY KEY (id)
);

CREATE TABLE role(
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

INSERT INTO role (title, salary, department_id)
VALUES ("Marketing Manager", 120000, sales), 
("Front End Developer", 120000, Engineering), 
("Underwriter", 120000, Legal), 
("Accountant", 120000, Finance),
("Account Exectutive", 120000, sales), 
("Software Engineer", 120000, Engineering), 
("Attorney", 120000, Legal), 
("Book Keeper", 120000, Finance);

INSERT INTO employee (first_name, last_name, role_id)
VALUES ("Patrick", "Ly", "Software Engineer"),
("Pierre", "Bourbonais", "Marketing Manager"),
("Nancy", "Murphy", "Accountant"),
("Matia", "Marks", "Underwriter"),
("Lauren", "Friedman", "Account Executive"),
("Jacqueline", "Nguyen", "Front End Developer"),
("Mark", "Fiore", "Attorney"),
("Teresa", "Knight", "Book Keeper");