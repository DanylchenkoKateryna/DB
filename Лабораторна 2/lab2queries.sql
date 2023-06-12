USE lab1
GO
/*
--�	SELECT �� ��� ���� ������� � ������������� ����������, ����������� ���� � �������� OR �� AND.
SELECT * FROM Passport
WHERE Surname='Daniels' OR (Name='Len' AND Surname='Franco')
ORDER BY Surname;

--�	SELECT � ������� ������������ ���� (������) � �������� ����������.
SELECT COUNT(Career.EmployeeId) AS CountOfEmployee
FROM Career
WHERE StartDate>='Jan 29, 2018';

--�	SELECT �� ��� ������ ������� � ������������� ����������, ����������� ���� � �������� OR �� AND.
SELECT EmployeeId 
FROM Career INNER JOIN Employee ON Career.EmployeeId=Employee.Id
INNER JOIN Passport ON Employee.PassportId=Passport.Id
WHERE Surname='Daniels' OR Name='Len' AND Surname='Franco'
ORDER BY Surname;

--�	SELECT �� ��� ������ ������� � ����� �������� Outer Join.
SELECT * FROM Employee FULL OUTER JOIN Passport ON Employee.PassportId=Passport.Id


--�	SELECT � ������������� ��������� Like, Between, In, Exists, All, Any.
Select Passport.Id
From Passport
Where Passport.Surname like 'Dan%' or Passport.BirthDate between '2000-01-01' and '2015-01-01' or Adress in('Dublin');

select PositionDepartment.Id
from PositionDepartment
where PositionDepartment.Id = any
(select Position.Id
from Position
where Salary< 15000)


select PositionDepartment.PositionId
from PositionDepartment 

select Id
from Position
where CountOfVacationDays>19


select distinct PositionDepartment.PositionId
from PositionDepartment


select distinct PositionDepartment.PositionId
from PositionDepartment
where PositionId = all
(select Id
from Position
where CountOfVacationDays>19);

select Id,Name ,Surname
from Passport
where not exists(select *
from Passport
where Surname='Francoy')



--�	SELECT � ������������� ������������� �� ����������.
SELECT Career.EmployeeId,SUM(Position.Salary) AS Salary
FROM Career INNER JOIN PositionDepartment ON Career.PositionDepartmentId=PositionDepartment.Id
INNER JOIN Position ON PositionDepartment.PositionId=Position.Id
WHERE Career.EndDate IS NULL
GROUP BY EmployeeId


--�	SELECT � ������������� ��-������ � ������ Where.
SELECT Id FROM Position WHERE Id IN (SELECT Id FROM Position WHERE Salary>15000);

--�	SELECT � ������������� ��-������ � ������ From.
SELECT * FROM (SELECT * FROM Passport WHERE Name = 'Len') AS PName


--�	UPDATE �� ��� ���� �������.
UPDATE Passport
SET Name='Mykyta'
WHERE ID=7

--�	UPDATE �� ��� ������ �������.
UPDATE Position
SET Salary=30000
WHERE Id IN (SELECT PositionId FROM PositionDepartment)


--�	Append (INSERT) ��� ��������� ������ � ���� ��������� ����������.
INSERT INTO [Career] (Id,EmployeeId,PositionDepartmentId,StartDate,EndDate)          
VALUES                                                                       
  (8,8,8,'Jan 29, 2018','Sep 30, 2022')
  

  --�	Append (INSERT) ��� ��������� ������ � ����� �������.
  INSERT INTO [Employee](Id,PassportId)
  select  8,Passport.Id
  from Passport where Surname like 'Veremiy'
  
  
  --�	DELETE ��� ��������� ��� ����� � �������.
  DELETE FROM Passport


  --�	DELETE ��� ��������� �������� ������ �������.
  DELETE FROM Career
  WHERE EndDate IS NOT NULL

  --------------------------------------------------------------------------------------------
  
  --�	������ ��������� ����� (���� � ��������).
  select Department.IdName as DepartmentName,Career.Id as CareerId,Passport.Name,Passport.Surname
  from Career inner join PositionDepartment on Career.PositionDepartmentId=PositionDepartment.Id
  right join Department on PositionDepartment.DepartmentId=Department.IdName
  left join Employee on Career.EmployeeId=Employee.Id
  left join Passport on Employee.PassportId=Passport.Id
  where Career.EndDate is null
  

  
  --�	������ ���������� � ��������� ������ ������������ �������� � �������� ��� ���������� � ��������� ��� ������� ����������.
  select EmployeeId,Vacation.StartDate,Vacation.EndDate, sum(datediff(day,Vacation.StartDate, Vacation.EndDate) + 1) AS total
from Career inner join Vacation On Career.Id=Vacation.CareerId
inner join PositionDepartment on PositionDepartment.Id=Career.PositionDepartmentId
inner join Position On Position.Id=PositionDepartment.PositionId
where Career.EndDate is null
group by EmployeeId,Position.CountOfVacationDays,Vacation.StartDate,Vacation.EndDate



--�	������ ���������� � ��������� ������ �� ������.
select Career.EmployeeId,Position.Name as Position,Position.Salary
from Career inner join PositionDepartment on Career.PositionDepartmentId=PositionDepartment.Id
inner join Position on PositionDepartment.PositionId=Position.Id
where Career.EndDate is null



--�	������ ����� � ��������� �������� �� ������� ���������.
select PositionDepartment.DepartmentId,Passport.Surname, Count(*) "Count"
from Department right join PositionDepartment on  PositionDepartment.Id=Department.BossPositionId
	inner join Career c1 on (c1.PositionDepartmentId=PositionDepartment.Id and c1.EndDate is null)
	inner join Employee e1 on c1.EmployeeId=e1.Id
    inner join Passport on e1.PassportId=Passport.Id --choose boos employee
    inner join PositionDepartment pd1 on  pd1.DepartmentId=Department.IdName
	inner join Career c2 on (c2.PositionDepartmentId=pd1.Id and c2.EndDate is null)
	inner join Employee e2 on c2.EmployeeId=e2.Id
	inner join Passport p2 on e2.PassportId=p2.Id ---add other employee
    group by PositionDepartment.DepartmentId,Passport.Surname
	
	--Pivot

	
SELECT * FROM   
(
    SELECT 
        PositionDepartment.DepartmentId pd, 
        Employee.Id e
    FROM 
        Career inner join PositionDepartment on Career.PositionDepartmentId=PositionDepartment.Id
inner join Employee on Career.EmployeeId=Employee.Id
inner join Passport on Employee.PassportId=Passport.Id
where Career.EndDate is null
) t 
PIVOT(
    COUNT(e) 
    FOR pd IN (
        [Magna Nam], 
        [Ligula Tortor Incorporated])
) AS pivot_table;
*/