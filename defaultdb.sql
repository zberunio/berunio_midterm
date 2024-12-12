CREATE DATABASE defaultdb;
DROP DATABASE defaultdb;

USE defaultdb;

SHOW DATABASES;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DESC users;

SELECT * FROM users;

INSERT INTO users (fullname, username, password)
VALUES
('Zachary Yuri Berunio', 'zactzyofficial', '123456'),
('Edison Sola', 'sirbrod', '123456'),
('Yaney Villaraza', 'yaney', '123456'),
('Dexter Morana', 'ninong', '123456'),
('Bryan Palencia', 'titoburaayaannn', '123456'),
('Benjie Bulahan', 'Rian', '123456'),
('Rustan Cabras', 'daddy', '123456'),
('Earlbelmar Dacian', 'gs', '123456'),
('Romeer Villanueva', 'chikito', '123456'),
('Rayalexis Aguirre', 'alex', '123456'),
('Fritz Imperial', 'fimperial', '123456789');


CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_code VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO departments (dept_code, dept_name, user_id)
VALUES
('CCS', 'College of Computer Studies', 1),
('CAF', 'College of Accounting & Finance', 2),
('CCJE', 'College of Criminal Justice Education', 3),
('CBM', 'College of Business Management', 4),
('CAF', 'College of Accountancy and Finance', 5),
('COE', 'College of Engineering', 6),
('CAS', 'College of Arts and Science', 7),
('CHS', 'College of Health and Science', 8),
('COE', 'College of Education',9);

SELECT 
    departments.dept_id, 
    departments.dept_code AS dept, 
    departments.dept_name AS name, 
    users.fullname AS encoder
FROM 
    departments
JOIN 
    users ON departments.user_id = users.user_id;

DROP TABLE courses;
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255),
    course_code VARCHAR(255),
    user_id INT NOT NULL,
    dept_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO courses (course_name, course_code, user_id, dept_id)
VALUES
('Bachelor of Elementary Education', 'BEED', '9', '9'),
('Bachelor of Science in Criminology', 'BSCRIM', 3, 3),
('Bachelor of Science in Nursing', 'BSN', 8),
('Bachelor of Science in Business Administration', 'BSBA', 4, 4),
('Liberal Arts', 'AB', 7, 7),
('Master of Arts in Education', 'MAED', 9, 9),
('Master of Science in Criminology', 'MSCRIM', 3, 3),
('Bachelor of Science in Computer Science', 'BSCS', 1, 1),
('Bachelor of Secondary Education', 'BSED', 9, 9),
('Doctor of Philosophy', 'PHD', 9, 9),
('Bachelor of Science in Information System', 'BSIS', 1, 1),
('Master in Business Administration', 'MBA', 4, 4),
('Bachelor of Science in Computer Engineering', 'BSCOE', 6, 6),
('Master in Public Administration', 'MPA', 5, 5),
('6-month Caregiving', NULL, 8),
('Bachelor in Public Administration', NULL, 5, 5),
('Bachelor of Arts in Communication', NULL, 7, 7),
('Bachelor of Arts in English Language Studies', NULL, 7, 7),
('Bachelor of Elementary Education', NULL, 9, 9),
('Bachelor of Physical Education', NULL, 9, 9),
('Bachelor of Science in Accountancy', NULL, 5, 5),
('Bachelor of Science in Accounting Information Systems', NULL, 5, 5),
('Bachelor of Science in Biology', NULL, 7, 7),
('Bachelor of Science in Business Administration Major in Financial Management', NULL, 4, 4),
('Bachelor of Science in Business Administration Major in Human Resource Management', NULL, 4, 4),
('Bachelor of Science in Business Administration Major in Marketing Management', NULL, 4, 4),
('Bachelor of Science in Civil Engineering', NULL, 6, 6),
('Bachelor of Science in Computer Engineering', NULL, 6, 6),
('Bachelor of Science in Computer Science', NULL, 1, 1),
('Bachelor of Science in Criminology', NULL, 3, 3),
('Bachelor of Science in Entrepreneurship', NULL, 4, 4),
('Bachelor of Science in Geodetic Engineering', NULL, 6, 6),
('Bachelor of Science in Hospitality Management', NULL, 7, 7),
('Bachelor of Science in Industrial Security Management', NULL, 3, 3),
('Bachelor of Science in Information Systems', NULL, 1, 1),
('Bachelor of Science in Mathematics', NULL, 7, 7),
('Bachelor of Science in Medical Technology', NULL, 8),
('Bachelor of Science in Midwifery', NULL, 8),
('Bachelor of Science in Nursing', NULL, 8),
('Bachelor of Secondary Education', NULL, 9, 9),
('Batsilyer ng Sining sa Filipino', NULL, 7, 7),
('Diploma in Midwifery', NULL, 8),
('Doctor of Philosophy in Criminal Justice with Specialization in Criminology', NULL, 3, 3),
('Doctor of Philosophy Major in Educational Management', NULL, 9, 9),
('Doctor of Philosophy Major in Human Resource Management', NULL, 4, 4),
('Expanded Tertiary Education Equivalency and Accreditation Program (ETEEAP-BSCRIM)', NULL, 3, 3),
('Master in Business Administration', NULL, 4, 4),
('Master in Public Administration', NULL, 5, 5),
('Master of Arts in Education Major in Administration and Supervision', NULL, 9, 9),
('Master of Arts in Education Major in Economics', NULL, 9, 9),
('Master of Arts in Education Major in Educational Management', NULL, 9, 9),
('Master of Arts in Education Major in English', NULL, 9, 9),
('Master of Arts in Education Major in Filipino', NULL, 9, 9),
('Master of Arts in Education Major in Mathematics', NULL, 9, 9),
('Master of Arts in Education Major in Physical Education', NULL, 9, 9),
('Master of Arts in Education Major in Science', NULL, 9, 9),
('Master of Science in Criminology', NULL, 3, 3);


CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
	lname VARCHAR(255),
	fname VARCHAR(255),
	mname VARCHAR(255),
    user_id INT NOT NULL,
    dept_id INT NOT NULL,
    course_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO students (lname, fname, mname, user_id, dept_id, course_id)
VALUES
('Berunio', 'ZacharyYuri', 'N/A', 1, 1, 1);


DESC students;

SELECT * FROM students;
