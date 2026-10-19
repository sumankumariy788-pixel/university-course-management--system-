------------------------------------ASSIGNMENT-1-----------------------------------------------------------------------------------
-----------Creating tables----------------------------------------------
---Table 1. Students---

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(80) UNIQUE,
BirthDate DATE,
EnrollmentDate DATE
);


---Table 2. Courses---

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(80) NOT NULL,
DepartmentID INT 
CONSTRAINT fk_Department
REFERENCES Departments(DepartmentID),
Credits INT
);


---Table 3. Instructors---

CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(80) UNIQUE,
DepartmentID INT 
CONSTRAINT fk_Department
REFERENCES Departments(DepartmentID),
Salary DECIMAL(10,2)
);


---Table 4. Enrollments---

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT 
CONSTRAINT fk_Students
REFERENCES Students(StudentID),
CourseID INT 
CONSTRAINT fk_Courses
REFERENCES Courses(CourseID),
EnrollmentDate DATE
);


---Table 5. Departments---

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(80) NOT NULL
);


-----Inserting tables------------------------------------------------------------

INSERT INTO Students (StudentID,FirstName,LastName,Email,BirthDate,EnrollmentDate)
VALUES
(1,'John','Doe','john.doe@email.com','2000-01-15','2022-08-01'),
(2,'Jane','Smith','jane.smith@email.com','1999-05-25','2021-08-01');


INSERT INTO Courses (CourseID,CourseName,DepartmentID,Credits)
VALUES
(101,'Introduction to SQL',1,3),
(102,'Data Structures',2,4);


INSERT INTO Instructors (InstructorID,FirstName,LastName,Email,DepartmentID)
VALUES
(1,'Alice','Johnson','alice.johnson@univ.com',1),
(2,'Bob','Lee','bob.lee@univ.com',2);


INSERT INTO Enrollments(EnrollmentID,StudentID,CourseID,EnrollmentDate)
VALUES
(1,1,'101','2022-08-01'),
(2,2,'102','2021-08-01');


INSERT INTO Departments(DepartmentID,DepartmentName)
VALUES
(1,'Computer Science'),
(2,'Mathematics'); 

------Reading tables----------------------------------
select * from students;
select * from courses;
select * from instructors;
select* from enrollments;
select * from departments;

----------------Queries to Perform----------------------------
--Q1. Perform CRUD Operations on all tables. ---------------------------------------------
----Firstly, I will perform CRUD operations on the student table.---------------------------------------

--create-----
insert into
students(studentid, firstname, lastname, email, birthdate, enrollmentdate )
values
(3, 'Suman', 'Kumari', 'suman@email.com', '2005-04-14', '2024-08-01'),
(4, 'Ansh', 'Singh', 'ansh.singh@email.com', '2003-08-25', '2025-07-13'),
(5, 'Sarvesh', 'Gupta', 'sarvesh.gupta@email.com', '2004-11-02', '2023-03-01'),
(6, 'Rudra', 'Yadav', 'rudra.yadav@email.com', '2003-06-18', '2025-02-01'),
(7, 'Rupak', 'Mishra', 'rupak.mishra@email.com', '2004-09-09', '2026-04-01'),
(8, 'Vikas', 'Patel', 'vikas.patel@email.com', '2003-12-21', '2025-12-17'),
(9, 'Pooja', 'Jain', 'pooja@email.com', '2004-04-14', '2024-05-18'),
(10, 'Karan', 'Das', 'karan.das@email.com', '2003-02-28', '2023-07-19'),
(11, 'Prashansha', 'Jaiswal', 'prashansha.jas@email.com', '2004-11-02', '2023-04-19'),
(12, 'Sushant', 'Sharma', 'sushant.sharma@email.com', '2007-10-06', '2026-01-04'),
(13, 'Nisha', 'Sharma', 'nisha.sharma@email.com', '2003-07-25', '2024-09-29'),
(14, 'Alia', 'Bhatt', 'alia.bhatt@email.com', '2005-05-18', '2024-11-15');
--read--
select * from students;
----update-----
update students
set email = 'suman.kumari@gmail.com'
where studentid=3;
----delete----
delete from students
where studentid in (3,6);

--------------Then, I will create  courses table to perform CRUD operations.---------------------------------------------
----create--
insert into courses(courseid, coursename, departmentid, credits)
values
(103, 'Database Management', 6, 5),
(104, 'Web Development', 4, 6 ),
(105, 'Data Science', 3, 4 ),
(106, 'Mathematics', 1, 8),
(107, 'Statistics', 4, 3),
(108, 'Algebra', 3, 4),
(109, 'Calculus', 4, 6),
(110, 'Probability', 2, 5);
------read----
select * from courses;
---update----
update courses
set coursename = 'mathematics' 
where courseid=101;
-----delete---
delete from courses
where courseid in (103, 105);

--------Department table--------------------------

---create-----
insert into
departments
(departmentid, departmentname)
values
(3, 'English'),
(4, 'Chemistry'),
(5, 'Biology'),
(6, 'Physics'),
(7, 'Economics'),
(8, 'History'),
(9, 'Commerce'),
(10, 'Statistics');
----read-----
select * from departments;
-----update------
update departments
set departmentname = 'mathematics'
where departmentid=105;
-----delete---
delete from departments
where departmentid in (108,107);

---------Enrollments table-------------------------------------------------
----create-----
insert into enrollments
(enrollmentid, studentid, courseid, enrollmentdate)
values
(4, 4, 104, '2023-03-01'),
(7, 7, 107, '2025-12-02'),
(8, 8, 108, '2025-07-18'),
(9, 9, 109, '2023-08-08'),
(10, 10, 110, '2025-08-09');

select * from enrollments;
---update----
update enrollments
set enrollmentdate = '2024-04-24'
where enrollmentid=7;
----delete----
delete from enrollments
where enrollmentid=8;

-----------------Instructors----------------------------------
--create----
insert into 
instructors 
(instructorid, firstname, lastname, email, departmentid, salary)
values
(3, 'Amit', 'Sharma', 'amit.sharma@univ.com', 2, 35000),
(4, 'Neha', 'Verma', 'neha.verma@univ.com', 4, 40000),
(5, 'Raj', 'Singh', 'raj.singh@univ.com', 1, 45000),
(6, 'Pooja', 'Gupta', 'pooja.gupta@univ.com', 5, 38000),
(7, 'Ravi', 'Kumar', 'ravi.kumar@univ.com', 3, 42000),
(8, 'Anita', 'Yadav', 'anita.yadav@univ.com', 4, 50000),
(9, 'Suresh', 'Patel', 'suresh.patel@univ.com', 6, 48000),
(10, 'Kavita', 'Jain', 'kavita.jain@univ.com', 2, 36000),
(11, 'Deepak', 'Mishra', 'deepak.mishra@univ.com', 3, 44000),
(12, 'Meena', 'Das', 'meena.das@univ.com', 1, 39000);
-----read-----
select * from instructors;
----update---
update instructors
set salary= 35000
where instructorid=1;
update instructors
set salary= 50000
where instructorid=2;
-----delete----
delete from instructors
where instructorid in (3,7);


---Q.2 Retrieve students who enrolled after 2022.-----------------------------------------------------------------------------------------
select * from students
where enrollmentdate >='2022-12-31';


--Q.3 Retrieve courses offered by the Mathematics department with a limit of 5 courses.---------------
Select d.departmentid, c.Coursename
From courses c
Join departments d On 
c.Departmentid = d.Departmentid
Where d.departmentname = 'Mathematics'
Limit 5;


--Q.4 Get the number of students enrolled in each course, filterig for courses with more than 5 students.---------
select
courseid,
count(studentid) as numberofstudents
from enrollments
group by courseid
having count(studentid)>5;
-----Zero rows are returned because no course has more than 5 students enrolled in the enrollments table.-----------


--Q.5 Find students who are enrolled in both Introduction to SQL and Data Structures.-----
select 
s.studentid,
s.firstname,
s.lastname
from students s
join enrollments e on 
s.studentid=e.studentid
join courses c on 
e.courseid=c.courseid
where c.coursename in ('Introduction to SQL','Data Structures')
group by s.studentid, s.firstname, s.lastname
having count(distinct c.coursename)=2;
--No rows are displayed because no student is enrolled in both courses.----------------------


--Q.6 Find students who are either enrolled in Introduction to SQL or Data Structures.-------------------
select 
s.studentid,
s.firstname,
s.lastname
from 
students s
join enrollments e on 
s.studentid=e.studentid
join courses c on 
e.courseid=c.courseid
where c.coursename in ('Introduction to SQL','Data Structures');


--Q.7 Calculate the average number of credits for all courses.-------------------------------------------
select
avg(credits) as averagecredits
from courses;


--Q.8 Find the maximum salary of instructors in the computer science department.-------------------
select
max(i.salary) as maximumsalary
from instructors i
join departments d on 
i.departmentid=d.departmentid
where d.departmentname = 'Computer Science';


--Q.9. Count the number of students enrolled in each department.---------------------------------
select 
d.departmentname,
count(distinct e.studentid)as numberofstudents
from departments d
left join courses c on
d.departmentid=c.departmentid
left join enrollments e on 
c.courseid= e.courseid
group by d.departmentid, d.departmentname;


---Q.10. INNER JOIN: Retrieve students and their corresponding courses. -------------------------------------------------
select 
s.studentid,
s.firstname,
s.lastname,
c.coursename
from students s
inner join enrollments e on 
s.studentid= e.studentid
inner join courses c on 
e.courseid= c.courseid;


-----Q.11.LEFT JOIN: Retrieve all students and their corresponding courses, if any. -----------------------
select 
s.studentid,
s.firstname,
s.lastname,
c.coursename
from students s
left join enrollments e on
s.studentid = e.studentid
left join courses c on 
e.courseid=c.courseid;


----Q.12 Subquery: Find students enrolled in courses that have more than 10 students. -------------------------------
select  s.studentid, s.firstname, s.lastname
from students s
where s.studentid in 
(select e.Studentid
from enrollments e
where e.courseid in (
select courseid
from enrollments
group by courseid
having count(distinct studentid) > 10));
----No rows appear because no course has more than 10 enrolled students.


----Q.13 Extract the year from the EnrollmentDate of students. --------------------------------
Select studentid,
Extract(year from enrollmentdate) as enrollmentyear
from students;


----Q.14 Concatenate the instructor's first and last name. ---------------------
Select
concat(firstname,' ', lastname) as instructorname
from instructors;


---Q.15 Calculate the running total of students enrolled in courses. ------------------------
Select  enrollmentid, Studentid, Courseid ,enrollmentDate,
count(*) over
(order by enrollmentdate, enrollmentid
rows between unbounded preceding and current row) as runningtotal
from enrollments
order by enrollmentdate, enrollmentid;


--Q.16. Label students as 'Senior' or 'Junior' based on their year of enrollment.
----(If the enrollment date is more than 4 years from the current date, put the label 'Senior' otherwise 'Junior') 
Select studentid, firstname, lastname, enrollmentdate,
CASE
when enrollmentdate < current_date - interval '4 years'
then 'Senior'
else 'Junior'
end as StudentLevel
from students;
-----------------------------------------------Thank you---------------------------------------------------------------------------------------


