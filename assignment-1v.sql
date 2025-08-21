
--Departments Table--
--Creating Departments Table--

CREATE TABLE Departments(
Department_ID int primary key,
Department_name varchar(50) NOT NULL UNIQUE
)

--Inserting Values Into Departments--

INSERT INTO Departments (
Department_ID,
Department_name)
VALUES(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Civil'),
(5, 'Electronics'),
(6, 'AI&ML'),
(7, 'Data Science')

Select * from Departments

--Students Table--
--Creating Students Table--

CREATE TABLE Students(
Student_ID int Primary Key,
Student_name varchar(50) NOT NULL,
Age int Check(age>=17),
Department_ID int Foreign Key References Departments(Department_ID)
)

--Inserting Values Into Students Table--

INSERT INTO Students(
Student_ID,
Student_name,
Age,
Department_ID)
Values(4201, 'Vijay', 20, 3),
(4202, 'mani', 21, 1),
(4203, 'Anu', 19, 4),
(4204, 'bindu', 21, 2),
(4205, 'abhi', 19, 5),
(4206, 'teju', 18, 6),
(4207, 'rohith', 20, 7),
(4208, 'karan', 17, 6),
(4209, 'nia', 23, 2),
(4210, 'ali', 20, 3)

--Courses Table--
--Creating Courses Table--

CREATE TABLE Courses(
Course_ID int Primary Key,
Course_name varchar(50) NOT NULL,
Department_ID int Foreign Key References Departments(Department_ID)
)

--Inserting Values Into Courses Table--

INSERT INTO courses Values
(111, 'DBMS', 2),
(112, 'Circuits', 4),
(113, 'Python', 1),
(114, 'SQL', 7),
(115, 'Data Structures', 6),
(116, 'HTML', 5),
(117, 'VHDL', 3),
(118, 'circuit analysis', 2),
(119, 'fluid engineering', 3),
(120, 'Thermodynamics', 6)

--Displaying all students whose age is greater than 20--

select * from Students 
WHERE age>20

--Displaying all courses of the "Computer Science" department--

select * from Courses
WHERE Department_ID = 1
---or---
select Cou. * , Dep. * from Courses as Cou 
join Departments as Dep
ON Cou.Department_ID=Dep.Department_ID
Where Department_name='Computer Science'

--Displaying all students who belong to the "Electronics" department--

select Stu. * , Dep. * from Students as Stu
join Departments as Dep
ON Stu.Department_ID=Dep.Department_ID
Where Department_name='Electronics'

--Display students whose age is between 18 and 22--

select * from Students
Where age between 18 and 22

---joins---
--Inner Join--

select Stu. * , Dep.Department_name from Students as Stu
inner join Departments as Dep
ON Stu.Department_ID=Dep.Department_ID

--Left Join--

select Cou. * , Dep.Department_name from Courses as Cou 
left join Departments as Dep
ON Cou.Department_ID=Dep.Department_ID

--Right Join--

select Cou. * ,Stu.Student_name from Courses as Cou
Right join Students as Stu
ON Cou.Department_ID=Stu.Department_ID
