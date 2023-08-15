-- Active: 1691409047939@@127.0.0.1@5432@assignment

-- Create students table

CREATE TABLE
    students (
        student_id SERIAL PRIMARY KEY,
        student_name VARCHAR(100),
        age INT,
        email VARCHAR(100),
        frontend_mark INT,
        backend_mark INT,
        status VARCHAR(50)
    );

-- Create courses table

CREATE TABLE
    courses (
        course_id SERIAL PRIMARY KEY,
        course_name VARCHAR(100),
        credits INT
    );

-- Create enrollment table

CREATE TABLE
    enrollments (
        enrollment_id SERIAL PRIMARY KEY,
        -- student_id INTEGER REFERENCES students(student_id),
        student_id INT,
        CONSTRAINT fk_student_id Foreign Key (student_id) REFERENCES students(student_id),
        course_id INT,
        CONSTRAINT fk_course_id Foreign Key (course_id) REFERENCES courses(course_id)
    );

-- Insert sample data into students table

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Alice',
        22,
        'alice@example.com',
        55,
        57,
        NULL
    ), (
        'Bob',
        21,
        'bob@example.com',
        34,
        45,
        NULL
    ), (
        'Charlie',
        23,
        'charlie@example.com',
        60,
        59,
        NULL
    ), (
        'David',
        20,
        'david@example.com',
        40,
        49,
        NULL
    ), (
        'Eve',
        24,
        'newemail@example.com',
        45,
        34,
        NULL
    ), (
        'Rahim',
        23,
        'rahim@gmail.com',
        46,
        42,
        NULL
    );

-- Insert sample data into courses table

INSERT INTO
    courses (course_name, credits)
VALUES ('Next.js', 3), ('React.js', 4), ('Databases', 3), ('Prisma', 3);

-- Insert sample data into enrollments table

INSERT INTO
    enrollments (student_id, course_id)
VALUES (1, 1), (1, 2), (2, 1), (3, 2);

---------------------------------------------------------------------------------------

-- Queries

-- Query 1: Insert a new student record with the following details:

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Din Islam Rajin',
        22,
        'din.islam.rajin572@gmail.com',
        58,
        40,
        NULL
    );

-- Query 2: Retrieve names of students enrolled in 'Next.js' course

SELECT students.student_name
FROM students
    JOIN enrollments ON students.student_id = enrollments.student_id
    JOIN courses ON enrollments.course_id = courses.course_id
WHERE
    courses.course_name = 'Next.js';

-- Query 3: Update status of student with highest total mark to 'Awarded'

UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
        SELECT
            MAX(frontend_mark + backend_mark)
        FROM students
    );

-- Query 4: Delete courses with no enrolled students

DELETE FROM courses
WHERE course_id NOT IN (
        SELECT
            DISTINCT course_id
        FROM enrollments
    );

-- Query 5: Retrieve names of students with LIMIT and OFFSET

SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2
OFFSET 2;

-- Query 6: Retrieve course names and number of students enrolled

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS students_enrolled
FROM courses
    LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_name;

-- Query 7: Calculate and display average age of all students

SELECT AVG(age) AS average_age FROM students;

-- Query 8: Retrieve names of students with email addresses containing 'example.com'

SELECT student_name FROM students WHERE email LIKE '%@%';