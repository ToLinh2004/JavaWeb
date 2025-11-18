drop database if exists Testing_System;
create database Testing_System;
use  Testing_System;

create table Department(
DepartmentID tinyint unsigned auto_increment primary key,
DepartmentName varchar(50) not null
);
-- unsigned số nguyên ko dấu/ko âm

CREATE TABLE POSITION (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL Unique key
);

CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID) 
);


create table `Group` (
GroupID	  tinyint unsigned auto_increment primary key,
GroupName Nvarchar(20) not null unique key,
CreatorID tinyint unsigned,
CreateDate Datetime default now(),
foreign key(CreatorID) references `Account`(
AccountID)
);

CREATE TABLE GroupAccount( 
 	GroupID 	 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    AccountID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    JoinDate 	 	 	 	DATETIME DEFAULT NOW(), 
    PRIMARY KEY (GroupID,AccountID), 
    FOREIGN KEY(GroupID)  	 	REFERENCES `Group`(GroupID),  
 	FOREIGN KEY(AccountID)  	 	REFERENCES `Account`(AccountID)  
); 

CREATE TABLE TypeQuestion ( 
    TypeID  	 	 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    TypeName  	 	ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY 
); 


CREATE TABLE CategoryQuestion( 
    CategoryID 	 	 	 TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY 
	 	 
);

CREATE TABLE Question( 
    QuestionID 	 	 	 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    Content 	 	 	 	 	NVARCHAR(100) NOT NULL, 
    CategoryID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    TypeID 	 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    CreatorID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    CreateDate 	 	 	 	DATETIME DEFAULT NOW(), 
    FOREIGN KEY(CategoryID)  	REFERENCES CategoryQuestion(CategoryID), 
    FOREIGN KEY(TypeID)  	 	REFERENCES TypeQuestion(TypeID), 
    FOREIGN KEY(CreatorID)  	REFERENCES `Account`(AccountId)   
); 

CREATE TABLE Answer( 	
    AnswerID 	 	 	 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    Content 	 	 	 	 	NVARCHAR(100) NOT NULL, 
    QuestionID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    isCorrect 	 	 	 	BIT DEFAULT 1, 
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) 
); 


CREATE TABLE Exam( 
    ExamID 	 	 	 	 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    `Code` 	 	 	 	 	CHAR(10) NOT NULL, 
    Title  	 	 	 	NVARCHAR(50) NOT NULL, 
    CategoryID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    Duration 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    CreatorID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
    CreateDate 	 	 	 	DATETIME DEFAULT NOW(), 
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID), 
    FOREIGN KEY(CreatorID)  	REFERENCES `Account`(AccountId) 
); 



CREATE TABLE ExamQuestion( 
    ExamID 	 	 	 	TINYINT UNSIGNED NOT NULL, 
 	QuestionID 	 	 	TINYINT UNSIGNED NOT NULL, 
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID), 
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) , 
PRIMARY KEY (ExamID,QuestionID) 
); 


INSERT INTO Department (DepartmentName)
VALUES 
    ('Marketing'),
    ('Sales'),
    ('Security'),
    ('Human Resources'),
    ('Engineering');
INSERT INTO Position (PositionName)
VALUES
  ('Dev' ), ('Test' ), ('Scrum Master' ), ('PM' ),('Designer');

INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES
    ('acc01@gmail.com', 'user01', 'User One',   1, 6, '2020-01-01'),
    ('acc02@gmail.com', 'user02', 'User Two',   2, 7, '2020-01-02'),
    ('acc03@gmail.com', 'user03', 'User Three', 3, 8, '2020-01-03'),
    ('acc04@gmail.com', 'user04', 'User Four',  4, 9, '2020-01-04'),
    ('acc05@gmail.com', 'user05', 'User Five',  5, 10, '2020-01-05');

INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
VALUES
    ('Group Test 01', 11, '2020-02-01'),
    ('Group Test 02', 12, '2020-02-02'),
    ('Group Test 03', 13, '2020-02-03'),
    ('Group Test 04', 14, '2020-02-04'),
    ('Group Test 05', 15, '2020-02-05');

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
    (11, 11, '2020-03-01'),
    (12, 12, '2020-03-02'),
    (13, 13, '2020-03-03'),
    (14, 14, '2020-03-04'),
    (15, 15, '2020-03-05');
INSERT INTO TypeQuestion (TypeName)
VALUES
    ('Essay'),
    ('Multiple Choice'),
    ('True/False'),
    ('Practice'),
    ('Theory');
INSERT INTO CategoryQuestion (CategoryName)
VALUES
    ('Java'),
    ('ASP.NET'),
    ('Python'),
    ('SQL'),
    ('Ruby');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES
    ('Java Question 01',    1, 6, 11, '2020-04-01'),
    ('ASP.NET Question 01', 2, 7, 12, '2020-04-02'),
    ('Python Question 01',  3, 6, 13, '2020-04-03'),
    ('SQL Question 01',     4, 7, 14, '2020-04-04'),
    ('Ruby Question 01',    5, 8, 15, '2020-04-05');
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES
    ('Answer 01', 11, 0),
    ('Answer 02', 12, 1),
    ('Answer 03', 13, 0),
    ('Answer 04', 14, 1),
    ('Answer 05', 15, 1);
INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES
    ('EX001', 'Java Exam 01',    1, 60, 11, '2020-05-01'),
    ('EX002', 'ASP.NET Exam 01', 2, 60, 12, '2020-05-02'),
    ('EX003', 'Python Exam 01',  3, 90, 13, '2020-05-03'),
    ('EX004', 'SQL Exam 01',     4, 60, 14, '2020-05-04'),
    ('EX005', 'Ruby Exam 01',    5, 120, 15, '2020-05-05');

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES
    (6, 11),
    (7, 12),
    (8, 13),
    (9, 14),
    (10, 15);



