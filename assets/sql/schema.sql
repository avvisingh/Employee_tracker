DROP DATABASE IF EXISTS employee_tracker;

CREATE DATABASE employee_tracker;
USE employee_tracker;

CREATE TABLE department(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (30) NOT NULL UNIQUE
);

CREATE TABLE role (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR (30) NOT NULL,
    salary FLOAT DEFAULT 0,
    department_id INT,
    FOREIGN KEY (department_id)
		REFERENCES department(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE employee (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    role_id INT,
    manager_id INT,
    FOREIGN KEY (role_id)
		REFERENCES role(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (manager_id)
		REFERENCES employee(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);