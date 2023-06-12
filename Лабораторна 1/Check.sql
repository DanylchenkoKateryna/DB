USE lab1;
Go
/*
ALTER TABLE [dbo].[Vacation] WITH CHECK ADD CONSTRAINT [periodStartVacationtLessThenPeriodEnd] CHECK([StartDate]<=[EndDate])
Go
ALTER TABLE [dbo].[Vacation]CHECK CONSTRAINT [periodStartVacationtLessThenPeriodEnd]
Go

--ALTER TABLE [dbo].[Career] WITH CHECK ADD CONSTRAINT [periodStartCareerLessThanPeriodEnd] CHECK([StartDate]<=[EndDate])
--Go
--ALTER TABLE [dbo].[Career]CHECK CONSTRAINT [periodStartCareerLessThanPeriodEnd]
--Go

ALTER TABLE [dbo].[Position] WITH CHECK ADD CONSTRAINT [salaryIsPositive] CHECK([Salary]>=(0))
Go
ALTER TABLE [dbo].[Position]CHECK CONSTRAINT [salaryIsPositive]
Go

ALTER TABLE [dbo].[Position] WITH CHECK ADD CONSTRAINT [countVacationDaysPositive] CHECK([CountOfVacationDays]>=(0))
Go
ALTER TABLE [dbo].[Position]CHECK CONSTRAINT [countVacationDaysPositive]
Go
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [FK_DepartmentPositionDepartment] FOREIGN KEY(BossPositionId) REFERENCES PositionDepartment(Id)
Go

ALTER TABLE [dbo].[PositionDepartment] ADD CONSTRAINT [FK_PositionDepartmentPosition] FOREIGN KEY(PositionId) REFERENCES Position(Id)
	
Go

ALTER TABLE [dbo].[PositionDepartment] ADD CONSTRAINT [FK_PositionDepartmentDepartment] FOREIGN KEY(DepartmentId) REFERENCES Department(IdName);
Go
*/
create unique nonclustered index ix_department_BossPositionId
on [dbo].[Department](BossPositionId)
where BossPositionId is not null ;





