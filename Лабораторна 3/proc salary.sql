
create or alter proc getSalary(@currentDep nvarchar(50),@StartMonth date,@EndMonth date)
as
begin
 select @currentDep as DepartmentName,sum(genSum) as TotalSum
 from(
select sum(mmoney*differ/(DATEDIFF(day,@StartMonth,@EndMonth)+1)) as genSum,emp
from (select Career.Id as CID,Employee.Id as emp,Position.Salary as mmoney, Sum(DATEDIFF(day,IIF(@StartMonth<Career.StartDate,Career.StartDate,@StartMonth),IIF(@EndMonth<isnull(Career.EndDate,@EndMonth), @EndMonth,isnull(Career.EndDate,@EndMonth)))) as differ
	 from Career inner join PositionDepartment on Career.PositionDepartmentId=PositionDepartment.Id
	 inner join Position on PositionDepartment.PositionId=Position.Id
	 inner join Employee on Career.EmployeeId=Employee.Id
	 where PositionDepartment.DepartmentId=@currentDep and Career.EndDate is null
	 group by Career.Id,Position.Salary,Employee.Id) as r
	 group by emp) as generalSum

end
go
----------------------------------------------------------------------------------------
create or alter proc getSalaryForAllDepartments (@StartMonth1 date,@EndMonth1 date)
as
begin
DECLARE @IdName nvarchar(50);

DECLARE dep_cursor CURSOR FOR
SELECT IdName
FROM Department;

OPEN dep_cursor

FETCH NEXT FROM dep_cursor
INTO @IdName

WHILE @@FETCH_STATUS = 0
BEGIN
   exec getSalary @currentDep=@IdName,@StartMonth=@StartMonth1,@EndMonth=@EndMonth1

   FETCH NEXT FROM dep_cursor INTO @IdName
END
CLOSE dep_cursor;

DEALLOCATE dep_cursor;

end
go

exec getSalaryForAllDepartments @StartMonth1='Dec 1,2021',@EndMonth1='Dec 30,2021'



