IF DB_ID('ItCompany') IS NOT NULL
begin
   print 'ItCompany exists'
end
else
begin
    create database  [ItCompany]
end

go

use [ItCompany]

CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  name VARCHAR(100),
);

CREATE TABLE [User] (
  user_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Project (
  project_id INT PRIMARY KEY,
  name VARCHAR(100),
);

CREATE TABLE Employee_Project (
  employee_id INT,
  project_id INT,

  PRIMARY KEY (employee_id, project_id),
  FOREIGN KEY (employee_id) REFERENCES [User](user_id),
  FOREIGN KEY (project_id) REFERENCES Project(project_id)
);


INSERT INTO [User] VALUES (1, 'Alex', 'Alex@gmail.com', 1)
INSERT INTO [User] VALUES (2, 'Lyonya', 'Lyonya@gmail.com', 2)
INSERT INTO [User] VALUES (3, 'Lena', 'Lena@gmail.com', 3)

INSERT INTO Department VALUES (1, 'Department_1')
INSERT INTO Department VALUES (2, 'Department_2')
INSERT INTO Department VALUES (3, 'Department_3')

INSERT INTO Project VALUES (1 , 'Project_1')
INSERT INTO Project VALUES (2 , 'Project_2')
INSERT INTO Project VALUES (3 , 'Project_3')

SELECT * FROM [User]
SELECT * FROM Department
SELECT * FROM Project

INSERT INTO Employee_Project VALUES (2, 3)
INSERT INTO Employee_Project VALUES (3, 1)
INSERT INTO Employee_Project VALUES (1, 2)