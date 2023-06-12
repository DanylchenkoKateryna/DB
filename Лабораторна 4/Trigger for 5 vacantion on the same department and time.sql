
create or alter trigger vacation_less5_trigger
on Vacation
for insert,update
as
print 'No more than 5% of employees of one department can be on vacation at the same time.'
declare @departmentname nvarchar(50),@startdate date,@enddate date
select @departmentname=(select DepartmentId from PositionDepartment inner join Career on Career.PositionDepartmentId=PositionDepartment.Id
where Career.Id=inserted.CareerId),
@startdate=inserted.StartDate,
@enddate=inserted.EndDate
from inserted
if(
exists(
SELECT DepartmentId,Count(EmployeeId) AS CountEmployee
FROM Career inner join PositionDepartment ON Career.PositionDepartmentId=PositionDepartment.Id
inner join Vacation on Vacation.CareerId=Career.Id
WHERE DepartmentId=@departmentname and Vacation.StartDate>=@startdate and Vacation.EndDate<=@enddate and Career.EndDate is null
GROUP BY DepartmentId
HAVING COUNT(EmployeeId)>CEILING(0.05*COUNT(EmployeeId))))
rollback tran
go

