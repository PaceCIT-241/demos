START TRANSACTION; -- BEGIN does the same thing

-- run a bunch of insert statements together
insert into school.courses (Name, Code, Description, Credits) VALUES
    ('Intro to Computer Science', 'CS 121', 'Python Programming', 4),
    ('Object Oriented Programming', 'CS 122', 'Java Programming', 4),
    ('Intro to Coding Using Python', 'CIT 261', 'Python Programming', 4),
    ('Blue Colab I', 'CIT 349', 'Blue Colab project course', 3),
    ('Blue Colab II', 'CIT 350', 'Blue Colab project course', 3);

savepoint sp1;

insert into school.courses (Name, Code, Description, Credits) VALUES
    ('Intro to Information Technology', 'CIT 110', 'unknown', 3),
    ('Computer Security Overview', 'CIT 251', 'unknown', 4),
    ('Intro to Geographic Info Systems', 'CIT 351', 'GIS mapping', 4);

-- COMMIT;

-- ROLLBACK;

rollback to sp1;

begin;
delete from school.courses where `CourseID` > 2;
commit;