USE lab1;
Go
INSERT INTO [Passport] (Id,Name,Surname,PassportNumber,BirthDate,BirthAdress,Adress)
VALUES
  (1,'Evangeline','Daniels',12345678,'03/03/2023','Wolfville','Shchensk'),
  (2,'Len','Franco',23456765,'05/17/1972','Cumaribo','Green Bay'),
  (3,'Reuben','Love',45623431,'02/07/1944','Cusco','Feilding'),
  (4,'Blaze','Sanchez',09876544,'09/22/2006','Rankweil','Miryang'),
  (5,'Kenyon','Flynn',65646363,'06/16/1989','Galway','Dublin'),
  (6,'Volodymyr','Daniels',12345678,'03/03/2023','Wolfville','Shchensk'),
  (7,'Taras','Bulba',12345678,'03/03/2023','Wolfville','Shchensk'),
  (8,'Olha','Veremiy',12345678,'03/03/2023','Wolfville','Shchensk');
Go


INSERT INTO [Employee] (Id,PassportId)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8);
Go

INSERT INTO [Department] (IdName,Abbreviation,BossPositionId)
VALUES
  ('Magna Nam','MN',NULL),
  ('Ligula Tortor Incorporated','LTI',NULL);   
GO


INSERT INTO [Position] (Id,Name,Salary,CountOfVacationDays) 
VALUES
  (1,'Boss',60987,21),                                 
  (2,'Lawyer',40599,27),               
  (3,'Secretary',28599,21),
  (4,'Cleaner',20599,25);
Go

INSERT INTO [PositionDepartment] (Id,PositionId,DepartmentId,Description) 
VALUES
  (1,1,'Magna Nam','Boss in Magna Nam department'),
  (2,1,'Ligula Tortor Incorporated','Boss in Ligula Tortor Incorporated department'),
  (3,2,'Magna Nam','Lawyer in Magna Nam department'),
  (4,2,'Ligula Tortor Incorporated','Lawyer in Ligula Tortor Incorporated department'),
  (5,3,'Magna Nam','Secretary in Magna Nam department'),
  (6,3,'Ligula Tortor Incorporated','Secretary in Ligula Tortor Incorporated department'),
  (7,4,'Magna Nam','Cleaner in Magna Nam department'),
  (8,4,'Ligula Tortor Incorporated','Cleaner in Ligula Tortor Incorporated department');
Go

UPDATE Department
SET BossPositionId=1
WHERE IdName='Magna Nam';
Go

UPDATE Department
SET BossPositionId=2
WHERE IdName='Ligula Tortor Incorporated';
Go

  
  INSERT INTO [Career] (Id,EmployeeId,PositionDepartmentId,StartDate,EndDate)          --less than 20 employee in the same department(test -m) (5 for test)Add 5-ok,add 6-trigger (8,8,7,'Dec 25, 2021',NULL)-ok (9,4,5,'Dec 25, 2021',NULL)-trigger;
VALUES                                                                       --employee cant work in departments where boss` surname is the same   (8,6,4,'Jan 29, 2018','Sep 30, 2023')-ok (9,6,3,'Jan 29, 2018','Sep 30, 2023')tr;
  (1,1,1,'Jan 29, 2018',NULL), --m Boss Daniels works in 'Magna Nam' department
  (2,2,2,'Jan 24, 2010',NULL),--l Boss Franco in Ligula Tortor Incorporated department
  (3,3,3,'Jan 5, 2021',NULL),--m
  (4,4,4,'Jan 2, 2021','Sep 5, 2023'),--l
  (5,5,5,'Jun 16, 2012',NULL),--m
  (6,6,6,'Jan 25, 2021','Jan 25, 2022'),--l
  (7,7,7,'Dec 25, 2021',NULL);--m
Go

  INSERT INTO [Vacation] (Id,CareerId,StartDate,EndDate)  --count of days of vacantion can`t be less than count availible days 
VALUES                                                    --cant get vacation more that 5 employee in the same department and time  
  (1,1,'Feb 19, 2023','Feb 23, 2023'),--m still works
  (2,2,'Feb 5, 2023','Feb 24, 2023'),--l                1,3 have vacation and they from the same department .add empl from their dep careerId 5-ok,7-trigger  (5,5,'Feb 5, 2023','Feb 24, 2023')  (6,7,'Feb 5, 2023','Feb 24, 2023')
  (3,3,'Feb 5, 2023','Feb 24, 2023'),--m  still works          try for 'Feb 5, 2023','Feb 24, 2023' period 
  (4,4,'Feb 5, 2023','Feb 24, 2023');--l
 Go 
  