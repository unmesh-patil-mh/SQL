-- Basic SQL Queries Syntax Guide
-- l CREATE DATABASE
CREATE DATABASE database_name;
-- l USE DATABASE
USE database_name;
-- l CREATE TABLE
CREATE TABLE table_name ( column1 datatype constraint, column2 datatype constraint, ... );
-- l INSERT DATA
INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
-- l SELECT DATA
SELECT column1, column2 FROM table_name; SELECT * FROM table_name;
-- l UPDATE DATA
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;
-- l DELETE DATA
DELETE FROM table_name WHERE condition;
-- l ALTER TABLE
ALTER TABLE table_name ADD column_name datatype; ALTER TABLE table_name MODIFY
column_name datatype; ALTER TABLE table_name DROP COLUMN column_name;
-- l DROP TABLE
DROP TABLE table_name;
-- l CREATE INDEX
CREATE INDEX index_name ON table_name (column_name); CREATE UNIQUE INDEX
index_name ON table_name (column_name);
-- l DROP INDEX
DROP INDEX index_name ON table_name;
-- l CREATE VIEW
CREATE VIEW view_name AS SELECT column1, column2 FROM table_name WHERE
condition;
-- l DROP VIEW
DROP VIEW view_name;
-- l PRIMARY KEY
CREATE TABLE table_name ( column1 datatype PRIMARY KEY, column2 datatype );
-- l FOREIGN KEY
CREATE TABLE table_name ( column1 datatype, column2 datatype, FOREIGN KEY
(column2) REFERENCES other_table(column) );
-- l ORDER BY
SELECT * FROM table_name ORDER BY column_name ASC|DESC;
-- l GROUP BY
SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;
-- l HAVING
SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name HAVING
COUNT(*) > value;
-- l DISTINCT
SELECT DISTINCT column_name FROM table_name;
-- l BETWEEN
SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;
-- l LIKE
SELECT * FROM table_name WHERE column_name LIKE 'pattern';
-- l IN
SELECT * FROM table_name WHERE column_name IN (value1, value2, ...);
-- l IS NULL
SELECT * FROM table_name WHERE column_name IS NULL;
-- l JOINS
INNER JOIN: SELECT a.column1, b.column2 FROM table1 a INNER JOIN table2 b ON a.id =
b.id; LEFT JOIN: SELECT a.column1, b.column2 FROM table1 a LEFT JOIN table2 b ON a.id
= b.id; RIGHT JOIN: SELECT a.column1, b.column2 FROM table1 a RIGHT JOIN table2 b ON
a.id = b.id;
-- l UNION
SELECT column_name FROM table1 UNION SELECT column_name FROM table2;
-- l CREATE USER
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
-- l GRANT PRIVILEGES
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';
-- l REVOKE PRIVILEGES
REVOKE ALL PRIVILEGES ON database_name.* FROM 'username'@'localhost';
-- l SHOW DATABASES / TABLES
SHOW DATABASES; SHOW TABLES;
-- l DESCRIBE TABLE
DESCRIBE table_name;