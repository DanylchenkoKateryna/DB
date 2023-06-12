
Create login login1
with password='123456tT'
go

Create user user1
for login login1
go

Create login login2
with password='123456tT'
go

Create user user2
for login login2
go

Create login login3
with password='123456tT'
go

Create user user3
for login login3
go

GRANT SELECT, INSERT, UPDATE, DELETE ON Career TO user1;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO user1;
GRANT SELECT, ON Department TO user1;
GRANT SELECT, ON Passport TO user1;
GRANT SELECT, ON Position TO user1;
GRANT SELECT, ON PositionDepartment TO user1;
GRANT SELECT, ON Vacation TO user1;

GRANT SELECT ON Career TO user2;
GRANT SELECT ON Department TO user2;
GRANT SELECT ON Employee TO user2;
GRANT SELECT ON Passport TO user2;
GRANT SELECT,INSERT,UPDATE ON Position TO user2;
GRANT SELECT ON PositionDepartment TO user2;
GRANT SELECT ON Vacation TO user2;

GRANT SELECT ON Career TO user3;
GRANT SELECT ON Department TO user3;
GRANT SELECT ON Employee TO user3;
GRANT SELECT, INSERT,UPDATE ON Passport TO user3;
GRANT SELECT ON Position TO user3;
GRANT SELECT ON PositionDepartment TO user3;
GRANT SELECT ON Vacation TO user3;


--«Спеціаліст з оцінки та розвитку персоналу» —Оцінка роботи співробітників,Аналіз даних та звітність,Ведення даних про співробітників.
CREATE ROLE SpecialistInPersonnelAssessmentAndDevelopment
GO

--«Спеціаліст з оплати праці та компенсацій» — може мати доступ до бази даних для збирання та обробки даних про заробітну плату, встановлення компенсаційних пакетів, ведення документації про виплати та ін.
CREATE ROLE PayrollAndCompensationSpecialist
GO

--«Рекрутер» — може робити оцінку кандидатів,вести їх список,додавати чи оновлвати особисту інформацію про користувача.
CREATE ROLE Recruiter
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON Career TO SpecialistInPersonnelAssessmentAndDevelopment;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO SpecialistInPersonnelAssessmentAndDevelopment;
GRANT SELECT, ON Department TO SpecialistInPersonnelAssessmentAndDevelopment;
GRANT SELECT, ON Passport TO SpecialistInPersonnelAssessmentAndDevelopment;
GRANT SELECT, ON Position TO SpecialistInPersonnelAssessmentAndDevelopment;
GRANT SELECT, ON PositionDepartment TO SpecialistInPersonnelAssessmentAndDevelopment;
GRANT SELECT, ON Vacation TO SpecialistInPersonnelAssessmentAndDevelopment;

GRANT SELECT ON Career TO PayrollAndCompensationSpecialist;
GRANT SELECT ON Department TO PayrollAndCompensationSpecialist;
GRANT SELECT ON Employee TO PayrollAndCompensationSpecialist;
GRANT SELECT ON Passport TO PayrollAndCompensationSpecialist;
GRANT SELECT,INSERT,UPDATE ON Position TO PayrollAndCompensationSpecialist;
GRANT SELECT ON PositionDepartment TO PayrollAndCompensationSpecialist;
GRANT SELECT ON Vacation TO PayrollAndCompensationSpecialist;


GRANT SELECT, INSERT ON Department TO Recruiter;
GRANT SELECT, ON Employee TO Recruiter;
GRANT SELECT, INSERT,UPDATE ON Passport TO Recruiter;
GRANT SELECT, INSERT ON Position TO Recruiter;
GRANT SELECT, INSERT ON PositionDepartment TO Recruiter;



--assign roles to users
ALTER ROLE SpecialistInPersonnelAssessmentAndDevelopment ADD MEMBER user1
GO
ALTER ROLE PayrollAndCompensationSpecialist ADD MEMBER user2
GO
ALTER ROLE redactor ADD MEMBER user3
GO

REVOKE SELECT, INSERT, UPDATE, DELETE ON Career TO user1;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Employee TO user1;
REVOKE SELECT, ON Department TO user1;
REVOKE SELECT, ON Passport TO user1;
REVOKE SELECT, ON Position TO user1;
REVOKE SELECT, ON PositionDepartment TO user1;
REVOKE SELECT, ON Vacation TO user1;

REVOKE  SELECT ON Career TO user2;
REVOKE  SELECT ON Department TO user2;
REVOKE  SELECT ON Employee TO user2;
REVOKE  SELECT ON Passport TO user2;
REVOKE  SELECT,INSERT,UPDATE ON Position TO user2;
REVOKE  SELECT ON PositionDepartment TO user2;
REVOKE  SELECT ON Vacation TO user2;

REVOKE  SELECT, INSERT,UPDATE ON Passport TO user3;
REVOKE  SELECT, INSERT ON Position TO user3;
REVOKE  SELECT, INSERT ON PositionDepartment TO user3;
REVOKE  SELECT, INSERT ON Department TO user3;


--видаляєо роль для юзера
ALTER ROLE SpecialistInPersonnelAssessmentAndDevelopment DROP MEMBER user1
GO
ALTER ROLE PayrollAndCompensationSpecialist DROP MEMBER user2
GO
ALTER ROLE Recruiter DROP MEMBER user3
GO


DROP ROLE SpecialistInPersonnelAssessmentAndDevelopment
GO
DROP ROLE PayrollAndCompensationSpecialist  
GO
DROP ROLE Recruiter  
GO

DROP LOGIN login1 ;
DROP LOGIN login2 ;
DROP LOGIN login3 ;

 execute as login='login2'
 select * from Employee;
 revert;
 