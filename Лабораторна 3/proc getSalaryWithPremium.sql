
create or alter proc getSalaryWithPremium(@interest float,@CurrentDate date)
as
begin
 select emp1,(salary2+(salary2*(CountOfYear*@interest)/100)) as finishSalary
from
(
select c1.EmployeeId as emp1, SUM(DATEDIFF(YEAR,c1.StartDate,IsNULL(c1.EndDate,@CurrentDate))) as CountOfYear
from career c1
group by c1.EmployeeId
) as s1
inner join
(
select c2.EmployeeId as emp2,sum(p2.Salary) as salary2
from Career c2 inner join PositionDepartment on c2.PositionDepartmentId=PositionDepartment.Id
inner join Position p2 on p2.Id=PositionDepartment.PositionId
group by c2.EmployeeId,c2.EndDate
having c2.EndDate is null
) as s2
on s1.emp1=s2.emp2

end
go

exec getSalaryWithPremium @interest=1.2,@CurrentDate='Jun 9,2023'







