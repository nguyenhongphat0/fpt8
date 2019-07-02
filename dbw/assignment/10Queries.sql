----------------
-- SQL SELECT --
----------------

-- 1. Where is the place that most students prefer taking OJT at?
SELECT TOP 1 c.Location, COUNT(f.Student) as 'Number of students'
FROM F_Result f, D_Company c
WHERE f.Company = c.ID
GROUP BY c.Location
ORDER BY 'Number of students' DESC
GO

-- 2. Numbers of Male and Female Students that have 6+ mark on the Summer 2019 OJT
SELECT COUNT(*) AS 'Number of Students that have 6+ mark', s.IsMale
FROM F_RESULT r, D_Student s, D_Time t
WHERE r.Student = s.ID AND r.Mark >= 6 AND r.Time = t.ID AND t.Semester = 'Summer' AND t.Year = 2019
GROUP BY s.IsMale
GO

-- 3. List these students who go to work by Bus and joined at least 2 activity
SELECT f.JoinedActivity, s.* FROM F_Satisfaction f, D_Transportation t, D_Student s
WHERE f.Transportation = t.ID AND f.JoinedActivity >= 2 AND s.ID = f.Student
GO

-- 4. What is the Company that Students have the most salary
SELECT f.Salary as 'Highest salary', c.* FROM F_Result f, D_Company c
WHERE f.Company = c.ID AND f.Salary = (SELECT MAX(Salary) FROM F_Result)
GO

-- 5. Average post subject’s finish percentage of assignment per Programing Language
SELECT t.ProgramingLanguage, AVG(f.AssignmentFinishedPercentage) AS 'Average Assignment Finish Rate'
FROM F_PostSubjectResult f, D_Technology t
WHERE f.Technology = t.ID
GROUP BY t.ProgramingLanguage
GO

----------------------
-- STORED PROCEDURE --
----------------------

-- 6. Average OJT salary by transportation
CREATE PROCEDURE AverageSalaryPerTransportation(@transportation AS VARCHAR(100))
AS
BEGIN
SELECT AVG(f.Salary) as 'Average Salary' FROM F_Satisfaction f, D_Transportation t
WHERE f.Transportation = t.ID AND t.Type = @transportation
GROUP BY t.Type
END;

EXEC AverageSalaryPerTransportation 'Bus'
GO

-- 7. List of students who joined an OJT at a defined semester
CREATE PROCEDURE ListStudents(@semester AS NCHAR(20), @year AS INT)
AS
BEGIN
SELECT s.* FROM F_Result f, D_Student s, D_Time t
WHERE t.Semester = @semester AND t.Year = @year AND s.ID = f.Student AND t.ID = f.Time
END;

EXEC ListStudents 'Summer', 2019
GO

-- 8. Numbers of Male and Female Students that have at least @minMark mark
CREATE PROCEDURE CountStudents(@minMark AS FLOAT)
AS
BEGIN
SELECT COUNT(*) AS 'Number of students', s.IsMale
FROM F_RESULT r, D_Student s
WHERE r.Student = s.ID AND r.Mark >= @minMark
GROUP BY s.IsMale
END;
GO

EXEC CountStudents 7
GO

-- 9. Programing language that have more than @x students used at OJT
CREATE PROCEDURE FindProgramingLanguage(@x AS FLOAT)
AS
BEGIN
SELECT t.ProgramingLanguage, COUNT(f.Student) AS NumberOfStudents FROM F_Result f, D_Technology t
WHERE f.Technology = t.ID
GROUP BY t.ProgramingLanguage
HAVING COUNT(f.Student) > @x
END;
GO

EXEC FindProgramingLanguage @x = 1
GO

-- 10. Which company that make the most absent student at the @subject subject after OJT
CREATE PROCEDURE CompanyMakeAbsent(@subject AS NCHAR(20))
AS
BEGIN
SELECT TOP 1 c.*, (30 - f.Attendance) AS Absent FROM F_PostSubjectResult f, D_Subject s, D_Company c
WHERE f.Subject = s.ID AND f.Company = c.ID AND s.Name = @subject
ORDER BY Absent DESC
END;
GO

EXEC CompanyMakeAbsent 'XML'
GO
