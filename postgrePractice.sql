-- Active: 1691409047939@@127.0.0.1@5432@practice_module

--

--

--!_________________________________## Task 1: ##_____________________________________

--

--

--SELECT and WHERE Clause Create a table named "employees" with columns (emp_id, emp_name, department, salary) and insert the following data:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department VARCHAR(50),
        salary DECIMAL(10, 2)
    );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department,
        salary
    )
VALUES (1, 'John Doe', 'HR', 50000.00), (2, 'Jane Smith', 'IT', 60000.00), (
        3,
        'Michael Johnson',
        'Finance',
        55000.00
    ), (
        4,
        'Emily Brown',
        'HR',
        52000.00
    );

--TODO: Write an SQL query to retrieve the names  and salaries of employees who work in the "HR" department.

--* ANS:

SELECT emp_name, salary FROM employees WHERE department = 'HR';

-- __________________________________________________________________________________

--

--

--!_________________________________## Task 2: ##_____________________________________

--

--

-- Task 2: Aggregation and HAVING Clause Create a table named "orders" with columns (order_id, customer_id, total_amount) and insert the following data:

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        total_amount DECIMAL(10, 2)
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        total_amount
    )
VALUES (101, 1, 200.00), (102, 2, 300.00), (103, 1, 150.00), (104, 3, 400.00), (105, 2, 250.00);

--TODO: Write an SQL query to find the customer IDs and the average total amount of their orders. Display only those customers whose average total amount is greater than or equal to 250.

-- *ANS

SELECT
    customer_id,
    AVG(total_amount)
FROM orders
GROUP BY customer_id
HAVING avg(total_amount) >= 250;

-- __________________________________________________________________________________

--

--

--!_________________________________## Task 3: ##_____________________________________

--

--

-- JOIN and GROUP BY Create two tables named "students" and "courses" with columns as follows:

CREATE TABLE
    students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        age INT,
        gender VARCHAR(10)
    );

CREATE TABLE
    courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(50),
        credits INT
    );

INSERT INTO
    students (
        student_id,
        student_name,
        age,
        gender
    )
VALUES (1, 'Alice', 22, 'Female'), (2, 'Bob', 21, 'Male'), (3, 'Charlie', 23, 'Male');

INSERT INTO
    courses (
        course_id,
        course_name,
        credits
    )
VALUES (101, 'Mathematics', 3), (102, 'History', 4), (103, 'Physics', 3);

-- Enrollment table with student-course relationships

CREATE TABLE
    enrollment (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT
    );

INSERT INTO
    enrollment (
        enrollment_id,
        student_id,
        course_id
    )
VALUES (1, 1, 101), (2, 1, 102), (3, 2, 103), (4, 3, 101);

--TODO: Write an SQL query to retrieve the student name, course name, and credits for all enrolled courses.

-- *ANS:

SELECT
    s.student_name,
    cr.course_id,
    cr.credits
FROM students s
    JOIN enrollment e on e.student_id = s.student_id
    JOIN courses cr on cr.course_id = e.course_id;

-- __________________________________________________________________________________

--

--

--!_________________________________## Task 4: ##_____________________________________

--

--

-- Multiple Joins and Aggregation Create three tables named "employees," "departments," and "salaries" with columns as follows:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department_id INT
    );

CREATE TABLE
    departments (
        department_id INT PRIMARY KEY,
        department_name VARCHAR(50)
    );

CREATE TABLE salaries ( emp_id INT, salary DECIMAL(10, 2) );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department_id
    )
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2), (3, 'Michael Johnson', 1), (4, 'Emily Brown', 3);

INSERT INTO
    departments (
        department_id,
        department_name
    )
VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO
    salaries (emp_id, salary)
VALUES (1, 50000.00), (2, 60000.00), (3, 55000.00), (4, 52000.00);

--TODO: Write an SQL query to retrieve the department name and the average salary of employees working in each department. Sort the results by the average salary in descending order.

--*ANS:

SELECT
    d.department_name,
    AVG(s.salary)
FROM employees e
    JOIN salaries s on s.emp_id = e.emp_id
    JOIN departments d on d.department_id = e.emp_id
GROUP BY d.department_name
ORDER BY AVG(salary) DESC;

-- __________________________________________________________________________________

--

--

--!_________________________________## Task 5: ##_____________________________________

--

--

-- Aggregation and Grouping Create a table named "orders" with columns (order_id, customer_id, order_date, total_amount) and insert the following data:

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE,
        total_amount DECIMAL(10, 2)
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        total_amount
    )
VALUES (101, 1, '2023-01-05', 200.00), (102, 2, '2023-01-06', 300.00), (103, 1, '2023-02-10', 150.00), (104, 3, '2023-02-15', 400.00), (105, 2, '2023-03-20', 250.00);

--TODO: Write an SQL query to find the total sales amount for each month, along with the number of orders in that month.

--*ANS:

SELECT
    to_char(order_date, 'Month'),
    SUM(total_amount),
    COUNT(*)
FROM orders
GROUP BY
    to_char(order_date, 'Month');

-- __________________________________________________________________________________

--

--

--!_________________________________## Task 6: ##_____________________________________

--

--

-- Using JOINs and Aggregation Create two tables named "employees" and "salaries" with columns as follows:

CREATE TABLE
    employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        department_id INT
    );

CREATE TABLE salaries ( emp_id INT, salary DECIMAL(10, 2) );

INSERT INTO
    employees (
        emp_id,
        emp_name,
        department_id
    )
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 2), (3, 'Michael Johnson', 1), (4, 'Emily Brown', 3);

INSERT INTO
    salaries (emp_id, salary)
VALUES (1, 50000.00), (2, 60000.00), (3, 55000.00), (4, 52000.00);

--TODO: Write an SQL query to retrieve the department name and the average salary of employees in each department, excluding departments with fewer than two employees.

--*ANS

-- __________________________________________________________________________________

--

--

--!_________________________________## Task 7: ##_____________________________________

--

--

-- Using HAVING with Aggregation Create a table named "products" with columns (product_id, product_name, stock_quantity) and insert the following data:

CREATE TABLE
    products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(50),
        stock_quantity INT
    );

INSERT INTO
    products (
        product_id,
        product_name,
        stock_quantity
    )
VALUES (101, 'Widget A', 20), (102, 'Widget B', 10), (103, 'Widget C', 15), (104, 'Widget D', 5);

--TODO: Write an SQL query to find the product names and their total sales quantity for products with a total sales quantity greater than 5.

--*ANS:

-- __________________________________________________________________________________

--

--!_________________________________## Task 8: ##_____________________________________

--

--

-- Combining Multiple Joins Create three tables named "customers," "orders," and "order_items" with columns as follows:

CREATE TABLE
    customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(50),
        city VARCHAR(50)
    );

CREATE TABLE
    orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE
    );

CREATE TABLE
    order_items (
        item_id INT PRIMARY KEY,
        order_id INT,
        product_name VARCHAR(50),
        quantity INT
    );

INSERT INTO
    customers (
        customer_id,
        customer_name,
        city
    )
VALUES (1, 'John Doe', 'New York'), (2, 'Jane Smith', 'Los Angeles'), (
        3,
        'Michael Johnson',
        'Chicago'
    );

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date
    )
VALUES (101, 1, '2023-01-05'), (102, 2, '2023-02-10'), (103, 1, '2023-02-15');

INSERT INTO
    order_items (
        item_id,
        order_id,
        product_name,
        quantity
    )
VALUES (1, 101, 'Widget A', 2), (2, 101, 'Widget B', 3), (3, 102, 'Widget C', 1), (4, 103, 'Widget A', 4);

--TODO: Write an SQL query to retrieve the customer name, order date, and the total quantity of items ordered for each order.

--*ANS:

-- __________________________________________________________________________________

--

--!_________________________________## Task 9: ##_____________________________________

--

--

-- Conditional Aggregation Create a table named "sales" with columns (sale_id, product_id, sale_date, sale_amount) and insert the following data:

CREATE TABLE
    sales (
        sale_id INT PRIMARY KEY,
        product_id INT,
        sale_date DATE,
        sale_amount DECIMAL(10, 2)
    );

INSERT INTO
    sales (
        sale_id,
        product_id,
        sale_date,
        sale_amount
    )
VALUES (1, 101, '2023-01-05', 200.00), (2, 102, '2023-01-06', 300.00), (3, 101, '2023-02-10', 150.00), (4, 103, '2023-02-15', 400.00), (5, 102, '2023-03-20', 250.00);

-- TODO: Write an SQL query to find the total sales amount for each product. However, if the total sales amount is less than 300, show it as 0.

-- *ANS:

-- __________________________________________________________________________________

--

--!_________________________________## Task 10: ##_____________________________________

--

--

-- Combining Multiple Aggregates Create a table named "students" with columns (student_id, student_name, age) and insert the following data:

CREATE TABLE
    students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(50),
        age INT
    );

INSERT INTO
    students (student_id, student_name, age)
VALUES (1, 'Alice', 22), (2, 'Bob', 21), (3, 'Charlie', 23);

--TODO: Write an SQL query to find the minimum, maximum, and average age of all students.

--*ANS:

-- __________________________________________________________________________________