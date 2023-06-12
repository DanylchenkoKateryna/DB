
create or alter trigger boss_surname_trigger
on Career
for insert,update
as
print 'People with the same last name as the boss of the department cannot work in the department'
declare @departmentname nvarchar(50),@bossSurname nvarchar(50)
select @departmentname=(select DepartmentId from PositionDepartment inner join Career on PositionDepartment.Id=Career.PositionDepartmentId where Career.Id=inserted.Id)
from inserted

select @bossSurname= (select Passport.Surname from Career 
INNER JOIN PositionDepartment ON Career.PositionDepartmentId=PositionDepartment.Id
INNER JOIN Department ON PositionDepartment.Id=Department.BossPositionId
INNER JOIN Employee ON Career.EmployeeId=Employee.Id
INNER JOIN Passport ON Employee.PassportId=Passport.Id
WHERE Department.IdName=@departmentname)
from inserted

if(
exists(
SELECT DepartmentId,COUNT(Passport.Surname) AS Surname
FROM Career inner join PositionDepartment ON Career.PositionDepartmentId=PositionDepartment.Id
INNER JOIN Employee ON Career.EmployeeId=Employee.Id
INNER JOIN Passport ON Employee.PassportId=Passport.Id
WHERE  Passport.Surname=@BossSurname AND DepartmentId=@DepartmentName
GROUP BY DepartmentId
HAVING COUNT(Passport.Surname)>1))
rollback tran
go
