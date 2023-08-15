<h3>SQL:</h3>
<h4>Leaen more</h4>
<p> => <a href="https://www.w3schools.com/sql/" target="_blank">w3 school</a></p>
<p> => <a href="https://cloud.google.com/learn/what-is-a-relational-database" target="_blank">what-is-a-relational-database</a></p>
<p> => <a href="https://www.educative.io/.../what-is-a-key-in-database..." target="_blank">what-is-a-key-in-database</a></p>
<p> => <a href="https://www.studytonight.com/dbms/database-key.php" target="_blank">database-key</a></p>
<p> => <a href="https://www.databasestar.com/entity-relationship-diagram/" target="_blank">Entity-relationship-diagram</a></p>
<br/>
<h4>SQL Note:</h4>
<p> => Note 1: <a href="https://drive.google.com/file/d/1L3lkqD1bIyAfpVWhrVm9APrk8mLYvJGa/view?usp=sharing" target="_blank">Database Normalization Basics</a></p>
<p> =>  Note 2: <a href="https://drive.google.com/file/d/1wdXaauImLzAUNs0QslVPmR82etQNdMFZ/view?usp=drive_link" target="_blank">How To Think While Designing Database</a></p></p>

Questions and Answers

1. What is PostgreSQL?
   => PostgreSQL is an open-source relational database management system (RDBMS) known for its extensibility, robustness, and support for advanced features. It uses SQL (Structured Query Language) for managing and querying data and provides features for data storage, retrieval, manipulation, and advanced analytics.

2. Purpose of a Database Schema in PostgreSQL
   => A database schema in PostgreSQL defines the structure, organization, and relationships of the database objects such as tables, views, indexes, and more. It acts as a blueprint for how data is stored and organized within the database, ensuring data integrity, security, and efficient management.

3. Primary Key and Foreign Key Concepts
   => Primary Key: A primary key uniquely identifies each record in a table. It ensures data uniqueness and integrity. In PostgreSQL, primary keys are created using the PRIMARY KEY constraint.
   => Foreign Key: A foreign key establishes a relationship between tables. It references the primary key of another table, enforcing referential integrity. In PostgreSQL, foreign keys are defined using the REFERENCES clause.
4. Difference Between VARCHAR and CHAR Data Types
   => VARCHAR: It stores variable-length strings. It's more efficient for storing strings with varying lengths.
   => CHAR: It stores fixed-length strings. It pads shorter strings with spaces. It's useful for fixed-length data storage.
5. Purpose of WHERE Clause in SELECT Statement
   => The WHERE clause filters records in a SELECT statement based on specified conditions. It allows you to retrieve only the rows that meet the criteria you define.

6. LIMIT and OFFSET Clauses
   => LIMIT: It restricts the number of rows returned in a query result.
   => OFFSET: It specifies the number of rows to skip before starting to return rows. Used with LIMIT, it facilitates paginated results.
7. Data Modification Using UPDATE Statements
   => The UPDATE statement modifies existing records in a table. It allows you to change specific column values based on defined conditions.

8. Significance of the JOIN Operation
   => The JOIN operation combines rows from two or more tables based on a related column. It allows you to retrieve data from multiple tables and establish relationships between them.

9. GROUP BY Clause and Aggregation
   => The GROUP BY clause is used with aggregate functions like COUNT, SUM, AVG, etc. It groups rows that have the same values in specified columns. Aggregates perform calculations on these groups.

10. Calculating Aggregate Functions in PostgreSQL
    => Aggregate functions are used in combination with the GROUP BY clause to perform calculations on groups of data. Examples include COUNT, SUM, and AVG.

11. Purpose of an Index
    => An index in PostgreSQL is a database object that improves query performance by allowing faster data retrieval. It's a data structure that provides quick access to rows based on indexed columns.

12. PostgreSQL Views vs. Tables
    => Tables: Store actual data.
    => Views: Virtual tables created from queries. They don't store data but provide an abstracted way to access and analyze data stored in tables.
