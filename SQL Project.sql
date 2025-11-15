CREATE TABLE Role (
   Id INT PRIMARY KEY,
   Role_Name VARCHAR(100)
)

CREATE TABLE User_Account (
   Id INT PRIMARY KEY,
   User_Name VARCHAR(100),
   Email VARCHAR(254),
   Password VARCHAR(200),
   Password_Salt VARCHAR(50) NOT NULL,
   Password_hash_Algorithm VARCHAR(50)
)

CREATE TABLE Status (
   Id INT PRIMARY KEY,
   Status_Name VARCHAR(100),
   Is_User_Working BIT,
)

CREATE TABLE User_Has_Role (
   Id INT PRIMARY KEY,
   Role_Start_Time DATETIME,
   Role_End_Time DATETIME NOT NULL,
   User_Account_Id INT FOREIGN KEY REFERENCES User_Account(Id),
   Role_Id INT FOREIGN KEY REFERENCES Role(Id)
)

CREATE TABLE User_Has_Status (
   Id INT PRIMARY KEY,
   Status_Start_Time DATETIME,
   Status_End_Time DATETIME NOT NULL,
   User_Account_Id INT FOREIGN KEY REFERENCES User_Account(Id),
   Status_Id INT FOREIGN KEY REFERENCES Status(Id)
)

INSERT INTO Role VALUES
(1, 'Sale'),
(2, 'Technical')

SELECT * FROM Role

INSERT INTO Status VALUES
(1, 'new status', 1),
(2, 'new status', 1)

SELECT * FROM Status

INSERT INTO User_Account VALUES
(1, 'abc', 'abc@xyz', 'abc', 'abcs', 'abcpha'),
(2, 'def', 'def@xyz', 'def', 'defg', 'defpha')

SELECT * FROM User_Account

INSERT INTO User_Has_Role VALUES
(1, '2023-04-12 01:45:22', '2024-05-22 02:45:22', 1, 1),
(2, '2021-11-10 03:45:22', '2026-05-22 02:45:22', 2, 2)

SELECT * FROM User_Has_Role

INSERT INTO User_Has_Status VALUES
(1, '2024-05-12 06:45:22', '2027-05-22 05:45:22', 1, 1),
(2, '2024-11-10 07:45:22', '2029-05-22 08:45:22', 2, 2)

SELECT * FROM User_Has_Status

ALTER TABLE User_Has_Status
DROP CONSTRAINT FK__User_Has___Statu__7755B73D

ALTER TABLE User_Has_Status
DROP CONSTRAINT FK__User_Has___User___76619304

ALTER TABLE User_Has_Status
DROP CONSTRAINT PK__User_Has__3214EC0797E3DFF6

DELETE FROM User_Has_Status
SELECT * FROM User_Has_Status

ALTER TABLE User_Has_Role NOCHECK CONSTRAINT ALL
DELETE FROM User_Has_Role
SELECT * FROM User_Has_Role

ALTER TABLE User_Account NOCHECK CONSTRAINT ALL
DELETE FROM User_Account
SELECT * FROM User_Account

ALTER TABLE Role NOCHECK CONSTRAINT ALL
DELETE FROM Role
SELECT * FROM Role

ALTER TABLE Status NOCHECK CONSTRAINT ALL
DELETE FROM Status
SELECT * FROM Status