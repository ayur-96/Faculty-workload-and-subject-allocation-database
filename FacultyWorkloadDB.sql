CREATE DATABASE FacultyWorkloadDB;
USE FacultyWorkloadDB;

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    max_workload INT NOT NULL
);

CREATE TABLE Subject (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    credits INT NOT NULL,
    weekly_hours INT NOT NULL
);

CREATE TABLE Allocation (
    allocation_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_id INT,
    subject_id INT,
    allocated_hours INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
        ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
        ON DELETE CASCADE
);

INSERT INTO Faculty (faculty_name, department, designation, max_workload)
VALUES
('Dr. Sharma', 'Computer Engineering', 'Professor', 16),
('Ms. Patil', 'Computer Engineering', 'Assistant Professor', 14),
('Mr. Kulkarni', 'Information Technology', 'Lecturer', 12);

INSERT INTO Subject (subject_name, semester, credits, weekly_hours)
VALUES
('Database Management System', 4, 4, 4),
('Operating Systems', 5, 4, 4),
('Computer Networks', 6, 3, 3);

INSERT INTO Allocation (faculty_id, subject_id, allocated_hours)
VALUES
(1, 1, 4),
(1, 2, 4),
(2, 1, 3),
(3, 3, 3);

SELECT f.faculty_name,
       SUM(a.allocated_hours) AS total_workload
FROM Faculty f
JOIN Allocation a ON f.faculty_id = a.faculty_id
GROUP BY f.faculty_name;

SELECT f.faculty_name,
       s.subject_name,
       a.allocated_hours
FROM Allocation a
JOIN Faculty f ON a.faculty_id = f.faculty_id
JOIN Subject s ON a.subject_id = s.subject_id;

SELECT f.faculty_name,
       SUM(a.allocated_hours) AS total_workload,
       f.max_workload
FROM Faculty f
JOIN Allocation a ON f.faculty_id = a.faculty_id
GROUP BY f.faculty_id
HAVING SUM(a.allocated_hours) > f.max_workload;