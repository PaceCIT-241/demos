-- create view syntax

CREATE VIEW ViewName AS
SELECT col1, col2
FROM table1
WHERE condition

use School

-- a view for showing student grades
create view StudentGrades AS
SELECT s.StudentID, s.FirstName, s.LastName, c.Code as Course, ifnull(gs.LetterGrade,'IP') as LetterGrade
from Rosters r 
left join Students s on r.StudentID = s.StudentID
left join GradingSystem gs on r.GradeID = gs.GradeID
left join ScheduledCourses sc on r.CRN = sc.CRN 
left join Courses c on sc.CourseID = c.CourseID

-- a view for calculating QPA
create view StudentQPA AS
SELECT s.StudentID, s.FirstName, s.LastName, 
sum(CASE when gs.Percent is not null then c.Credits end) as AppliedCredits,
(sum(case when gs.Percent is not null then gs.Value * c.Credits end) / sum(CASE when gs.Percent is not null then c.Credits end)) as QPA
from Rosters r 
left join Students s on r.StudentID = s.StudentID
left join GradingSystem gs on r.GradeID = gs.GradeID
left join ScheduledCourses sc on r.CRN = sc.CRN  
left join Courses c on sc.CourseID = c.CourseID 
group by s.StudentID, s.FirstName, s.LastName

DELIMITER \\

-- a procedure to return latin honors for a given student
create or replace PROCEDURE getHonors(studID int)
begin
    select case 
        when ifnull(QPA, 0.0) >= 3.85 then 'Summa cum laude'
        when ifnull(QPA, 0.0) >= 3.64 and qpa < 3.85 then 'Magna cum laude'
        when ifnull(QPA, 0.0) >= 3.5 and qpa < 3.64 then 'Cum laude'
        else ''
    end as 'Latin Honors'
    from StudentQPA where `StudentID` = studID;
end //

call getHonors(4);