USE lab1;
DROP TABLE IF EXISTS [dbo].[Passport]
Go
CREATE TABLE [dbo].[Passport](
    [Id] INT NOT NULL PRIMARY KEY,
    [PassportNumber] INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[Surname] VARCHAR(50) NOT NULL,
	[BirthDate] DATE NOT NULL,
	[BirthAdress] VARCHAR(200) NOT NULL,
	[Adress] VARCHAR(200) NOT NULL
);
Go

DROP TABLE IF EXISTS [dbo].[Employee]
Go
CREATE TABLE [dbo].[Employee](
    [Id] INT NOT NULL PRIMARY KEY,
    [PassportId] INT NOT NULL,
	FOREIGN KEY(PassportId) REFERENCES Passport(Id) 
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
Go

DROP TABLE IF EXISTS [dbo].[Department]
Go
CREATE TABLE [dbo].[Department](
    [IdName] VARCHAR(50) NOT NULL PRIMARY KEY,
    [Abbreviation] VARCHAR(20) NOT NULL,
	[BossPositionId] INT 
);
Go

DROP TABLE IF EXISTS [dbo].[Position]
Go
CREATE TABLE [dbo].[Position](
    [Id] INT NOT NULL PRIMARY KEY,
    [Name] VARCHAR(50) NOT NULL,
	[Salary] INT NOT NULL,
	[CountOfVacationDays] INT NOT NULL
);
Go

DROP TABLE IF EXISTS [dbo].[PositionDepartment]
Go
CREATE TABLE [dbo].[PositionDepartment](
    [Id] INT NOT NULL PRIMARY KEY,
    [PositionId] INT NOT NULL,
	[DepartmentId] VARCHAR(50) NOT NULL,
	[Description] VARCHAR(50) NOT NULL
);
Go

DROP TABLE IF EXISTS [dbo].[Career]
Go
CREATE TABLE [dbo].[Career](
    [Id] INT NOT NULL PRIMARY KEY,
	[EmployeeId] INT NOT NULL,
    [PositionDepartmentId] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE,
	FOREIGN KEY(PositionDepartmentId) REFERENCES PositionDepartment(Id),
	FOREIGN KEY(EmployeeId) REFERENCES Employee(Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
Go

DROP TABLE IF EXISTS [dbo].[Vacation]
Go
CREATE TABLE [dbo].[Vacation](
    [Id] INT NOT NULL PRIMARY KEY,
    [CareerId] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL
	FOREIGN KEY(CareerId) REFERENCES Career(Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
Go


