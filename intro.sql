-- Active: 1691409047939@@127.0.0.1@5432@university_management_system

--

--

-- _________________________How to create, Delete and Rename Database__________________;

--

--

--## Create Database:

CREATE DATABASE users;

---------------------------

--## Delete Database:

DROP DATABASE test;

---------------------------

--## Rename Database:

ALTER DATABASE test1 RENAME to test2;

---------------------------

--

--

-- _________________________How to create, Delete, Update and Rename Table__________________;

--

--

--## Create Table:

CREATE TABLE
    "users" (
        user_id SERIAL PRIMARY KEY,
        username VARCHAR(250) UNIQUE NOT NULL,
        email VARCHAR(250) UNIQUE NOT NULL,
        age INT DEFAULT 17
    );

-- CREATE TABLE

--     users1 (

--         user_id SERIAL,

--         username VARCHAR(250) NOT NULL,

--         email VARCHAR(250) NOT NULL,

--         PRIMARY KEY(user_id),

--         UNIQUE(username, email)

--     );

---------------------------

--## Rename Table:

ALTER TABLE student RENAME to learners;

---------------------------

--## Delete Database:

DROP TABLE "user";

---------------------------

--

--

-- _________________________How to Insert, Remove, Show and Modify Data and CONSTRAINT In a Table__________________;

--

--

--## Insert Into Table:

-- 1

INSERT INTO "users" VALUES (1, 'abcd', 'abcd@gmail.com');

-- 2

INSERT INTO
    "users" (username, email, age)
VALUES ('data2', 'data2@gmail.com', 21), ('data3', 'data3@gmail.com', 21), ('data4', 'data4@gmail.com', 21), ('data5', 'data5@gmail.com', 21);

---------------------------

--## Update Row In The Tabole:

UPDATE users set age = 80 WHERE user_id = 1;

--## Delete Row In The Tabole:

DELETE FROM users WHERE user_id = 2;

---------------------------

--## Delete All Row In The Tabole:

TRUNCATE TABLE "users";

---------------------------

--## Show Tabole:

SELECT * FROM "users" ;

-------------------##Alter Table##--------------------;

---------------------------

--## Add a Column:

ALTER TABLE "users"
ADD
    COLUMN country VARCHAR(255) DEFAULT 'bangladesh' NOT NULL;

---------------------------

--## Drop a Column:

ALTER TABLE "users" DROP COLUMN country;

---------------------------

--## Rename a Column:

ALTER TABLE Employe RENAME COLUMN deparment_id to dept_id;

---------------------------

--## Change a Datatype:

ALTER TABLE users ALTER COLUMN country type VARCHAR(255);

ALTER TABLE "users" ALTER COLUMN country type text;

---------------------------

--## Set DEFAULT Value:

ALTER TABLE users ALTER COLUMN country set DEFAULT 'Bangladesh';

---------------------------

--## Remove DEFAULT Value:

ALTER TABLE "user" ALTER COLUMN demo drop DEFAULT;

---------------------------

--## Add Constraint to a Column:

ALTER TABLE "users" ALTER COLUMN country set NOT NULL;

ALTER TABLE "users" ADD constraint unique_email UNIQUE(email);

---------------------------

--## Drop Constraint to a Column:

ALTER TABLE "users" ALTER COLUMN country DROP NOT NULL;

ALTER TABLE "users" DROP constraint unique_email UNIQUE(email);

SELECT * FROM "users" ;

--

--

-- _________________________How to Create and Insert Foreign Key in a Table__________________;

--

--

-- Create Department Table

CREATE TABLE
    if NOT EXISTS Department (
        dept_id SERIAL PRIMARY KEY,
        dept_name VARCHAR(250) NOT NULL
    );

INSERT into Department (dept_name) VALUES ('Research');

INSERT into
    Department (dept_name)
VALUES ('IT'), ('Engeneering'), ('Accountent'), ('Management'), ('Finance');

DELETE FROM Department WHERE dep_id = 2;

-- Create Employe Table

CREATE TABLE
    Employe (
        emp_id SERIAL PRIMARY KEY,
        emp_name VARCHAR(250) NOT NULL,
        emp_email VARCHAR(250) NOT NULL UNIQUE,
        age INT NOT NULL,
        deparment_id int,
        CONSTRAINT fk_constraint_id Foreign Key (deparment_id) REFERENCES Department(dept_id)
    );

INSERT INTO
    Employe(emp_name, emp_email, age)
VALUES (
        'mahmuda',
        'mahmuda@gmail.com',
        23
    );

INSERT into
    Employe (
        emp_name,
        emp_email,
        age,
        deparment_id
    )
VALUES (
        'salman',
        'salman@gmail.com',
        26,
        1
    ), (
        'pathan',
        'pathan@gmail.com',
        30,
        2
    ), ('jack', 'jack@gmail.com', 18, 3), (
        'siyam',
        'siyam@gmail.com',
        15,
        4
    ), (
        'kuddus',
        'kuddus@gmail.com',
        61,
        5
    ), ('pori', 'pori@gmail.com', 19, 1), ('mary', 'mary@gmail.com', 25, 2), (
        'salma',
        'salma@gmail.com',
        18,
        3
    ), (
        'anwara',
        'anwara@gmail.com',
        30,
        4
    ), (
        'mehjabin',
        'mehjabin@gmail.com',
        18,
        5
    );

DELETE FROM Employe WHERE emp_id = 1;

--

--

-- ___________________________________________Select Basics__________________________________________;

--

--

--## Select All from Table:

SELECT * FROM employe;

---------------------------

--## Select Some Column from Table:

SELECT emp_name,emp_email FROM employe;

-- unique

SELECT DISTINCT age FROM employe;

-- condition

SELECT * FROM employe WHERE age > 18;

SELECT emp_id, emp_name FROM employe WHERE age >= 18 AND age <= 25;

-- Not EQUAL

SELECT * FROM employe WHERE age <> 18;

---------------------------

--## Sorting Column from Table:

SELECT * FROM employe ORDER BY emp_name ASC LIMIT 2;

SELECT * FROM employe ORDER BY emp_name DESC LIMIT 2 OFFSET 5;

---------------------------

--## IN, NOT IN, BETWEEN, LIKE:

-- IN

SELECT * FROM employe WHERE emp_id IN (1,9,3);

-- NOT IN

SELECT * FROM employe WHERE emp_id IN (1,9,3);

-- BETWEEN

SELECT * FROM employe WHERE age BETWEEN 18 AND 25;

-- Like

-- show value anywhare on this column of this table

SELECT * FROM employe WHERE emp_name LIKE '%a%';

-- show value that Start with specific value on this column of this table

SELECT * FROM employe WHERE emp_name LIKE 'a%';

-- show value that end with specific value on this column of this table

SELECT * FROM employe WHERE emp_name LIKE '%a';

-- show value that Specific Position with specific value on this column of this table

SELECT * FROM employe WHERE emp_name LIKE '_a%';

---------------------------

--## Joining Between Two  Table:

-- INNER JOIN

SELECT *
FROM employe
    INNER JOIN department ON department.dept_id = employe.dept_id;

-- LEFT JOIN

SELECT *
FROM employe
    LEFT JOIN department ON department.dept_id = employe.dept_id;

-- RIGHT JOIN

SELECT *
FROM employe
    RIGHT JOIN department ON department.dept_id = employe.dept_id;

-- FULL JOIN

SELECT *
FROM employe
    FULL JOIN department ON department.dept_id = employe.dept_id;

-- NATURAL JOIN

SELECT * FROM employe NATURAL JOIN department;

-- CROSS JOIN

SELECT * FROM employe CROSS JOIN department;

---------------------------

--

--

-- _________________________Aggregation__________________;

--

--

--## Aggregation

-- AVG

SELECT AVG(age) from employe;

SELECT dept_id, AVG(age) from employe GROUP BY dept_id;

-- MIN

SELECT MIN(age) from employe;

-- MAX

SELECT MAX(age) from employe;

-- practice

SELECT
    d.dept_name,
    AVG(age),
    SUM(age),
    Max(age),
    MIN(age),
    COUNT(*)
FROM employe e
    FULL JOIN department d ON d.dept_id = e.dept_id
GROUP BY dept_name;

---------------------------