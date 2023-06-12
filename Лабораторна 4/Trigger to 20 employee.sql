
create or alter trigger employee_less20_trigger
on Career
for Insert,update
as
print 'Count of employee can`t be more than 20'
declare @CareerIdd int
declare @departmentname nvarchar(50)
select @departmentname=(select DepartmentId from PositionDepartment 
inner join Career on Career.PositionDepartmentId=PositionDepartment.Id 
inner join Department on PositionDepartment.DepartmentId=Department.IdName
where Career.Id=Inserted.Id)
from inserted
if(
exists(
SELECT IdName,COUNT(Career.EmployeeId) AS countEmployee
FROM Career inner join PositionDepartment ON Career.PositionDepartmentId=PositionDepartment.Id
inner join Department on PositionDepartment.DepartmentId=Department.IdName
WHERE  Career.EndDate IS NULL and IdName=@DepartmentName
GROUP BY IdName
HAVING COUNT(Career.EmployeeId)>20))
rollback tran
go


