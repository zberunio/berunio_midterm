CREATE DATABASE berunio;

USE berunio;

SHOW TABLES;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    passwordx VARCHAR(255) NOT NULL,
    fullname VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (username, passwordx, fullname)
VALUES
('djhay','0123456', 'Daniel Jhay Castroverde'),
('rustan', '09080706', 'Rustan Cabras'),
('ninong', '12345678', 'Dexter Morana'),
('gs' '24681300', 'Earl Belmar Dacian'),
('sirbrod', '12345678', 'Edison Sola'),
('rian', '12345678', 'Benjie Rian Bulahan'),
('titoburayann', '12345678', 'Bryan Palencia'),
('hokage', '12345678', 'Wilbert Albania');

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_code VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    user_id INT,
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
('COE', 'College of Education', 9);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255),
    course_code VARCHAR(255),
    user_id INT,
    dept_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO courses (course_name, course_code, user_id, dept_id)
VALUES
('Bachelor of Elementary Education', 'BEED', 9, 9),
('Bachelor of Science in Criminology', 'BSCRIM', 3, 3),
('Bachelor of Science in Nursing', 'BSN', 8, 8),
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
('6-month Caregiving', NULL, 8, 8),
('Bachelor in Public Administration', NULL, 5, 5),
('Bachelor of Arts in Communication', NULL, 7, 7),
('Bachelor of Arts in English Language Studies', NULL, 7, 7);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    lname VARCHAR(255),
    fname VARCHAR(255),
    mname VARCHAR(255),
    user_id INT,
    course_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (lname, fname, mname, user_id, course_id)
VALUES
('Berunio', 'Zachary Yuri', 'N/A', 1, 1);

DESC students;

SELECT * FROM students;

CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'secure_password';

GRANT ALL PRIVILEGES ON berunio.* TO 'app_user'@'localhost';

FLUSH PRIVILEGES;
