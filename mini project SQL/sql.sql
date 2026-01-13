

-- Department Table
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    dept_head VARCHAR(100)
);

-- Course Table
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Student Table
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    dept_id INT,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Marks Table
CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) CHECK (marks_obtained >= 0 AND marks_obtained <= 100),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- 3️⃣ INSERT SAMPLE DATA

-- Department Data
INSERT INTO department (dept_name, dept_head)
VALUES 
('Computer Science', 'Dr. A. Sharma'),
('Electronics', 'Dr. R. Patil'),
('Mechanical', 'Dr. S. Joshi');

-- Course Data
INSERT INTO course (course_name, dept_id)
VALUES 
('Database Systems', 1),
('Operating Systems', 1),
('Microprocessors', 2),
('Thermodynamics', 3);

-- Student Data
INSERT INTO student (first_name, last_name, dob, gender, dept_id, email, phone)
VALUES 
('Unmesh', 'Patil', '2002-05-10', 'Male', 1, 'unmesh@example.com', '9876543210'),
('Ayush', 'Deshmukh', '2003-02-20', 'Male', 2, 'ayush@example.com', '9823456789'),
('Rohan', 'Kadam', '2001-07-15', 'Male', 3, 'rohan@example.com', '9765432109');

-- Marks Data
INSERT INTO marks (student_id, course_id, marks_obtained, grade)
VALUES 
(1, 1, 89, 'A'),
(1, 2, 76, 'B+'),
(2, 3, 91, 'A+'),
(3, 4, 65, 'C+');

-- 4️⃣ CRUD OPERATIONS

-- ➕ INSERT Operations
-- Add New Department
INSERT INTO department (dept_name, dept_head)
VALUES ('Information Technology', 'Dr. P. More');

-- Add New Student
INSERT INTO student (first_name, last_name, dob, gender, dept_id, email, phone)
VALUES ('Jay', 'Kale', '2002-08-09', 'Male', 1, 'jay@example.com', '9876501234');

-- Add New Course
INSERT INTO course (course_name, dept_id)
VALUES ('Networks', 1);

-- Add New Marks
INSERT INTO marks (student_id, course_id, marks_obtained, grade)
VALUES (4, 5, 85, 'A');

-- 📝 UPDATE Operations
UPDATE student
SET email = 'unmeshpatil@gmail.com', phone = '9998887770'
WHERE student_id = 1;

UPDATE marks
SET marks_obtained = 92, grade = 'A+'
WHERE mark_id = 1;

UPDATE department
SET dept_name = 'IT Department'
WHERE dept_id = 4;

-- ❌ DELETE Operations
DELETE FROM marks WHERE mark_id = 4;
DELETE FROM student WHERE student_id = 4;
DELETE FROM department WHERE dept_id = 4;

-- 🔍 SELECT / VIEW Operations
-- View all students with department name
SELECT s.student_id, s.first_name, s.last_name, d.dept_name
FROM student s
LEFT JOIN department d ON s.dept_id = d.dept_id;

-- View marks with student and course details
SELECT s.first_name, s.last_name, c.course_name, m.marks_obtained, m.grade
FROM marks m
JOIN student s ON m.student_id = s.student_id
JOIN course c ON m.course_id = c.course_id;

-- 5️⃣ CREATE VIEW for easier access
CREATE OR REPLACE VIEW student_full_info AS
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    s.email, 
    s.phone, 
    d.dept_name, 
    c.course_name, 
    m.marks_obtained, 
    m.grade
FROM student s
LEFT JOIN department d ON s.dept_id = d.dept_id
LEFT JOIN marks m ON s.student_id = m.student_id
LEFT JOIN course c ON m.course_id = c.course_id;

-- Check data from view
SELECT * FROM student_full_info;

-- ===============================================
-- END OF SQL SCRIPT
-- ===============================================
