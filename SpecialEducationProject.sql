CREATE DATABASE SpecialEdProject
GO


use SpecialEdProject
go


create schema Sped
go


create table sped.Client
(
	ClientID Int not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	PhoneNumber varchar(20) not null,
	Email varchar(50) not null,
	[Address] varchar(50) not null,
	City varchar(30) not null,
	[State] varchar(30) not null,
	ZipCode varchar(15) not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.Employee
(
	EmployeeID Int not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	PhoneNumber varchar(20) not null,
	[Address] varchar(50) not null,
	City varchar(30) not null,
	[State] varchar(30) not null,
	ZipCode varchar(15) not null,
	JobTitle varchar(50) not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.ClientDisability
(
	ClientDisabilityID int not null,
	ClientID int not null,
	DisabilitytypeID int not null,
	DisabilityLevelID int not null,
	GoalID int not null,
	EntryDate date not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.Activity
(
	EmpClientActivityID int not null,
	ClientID int not null,
	ActivityTypeID int not null,
	EmployeeID int not null,
	ActivityStatusID int not null,
	ActivityScoreID int not null,
	ActivityDate date not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null,
)
go

create table sped.ActivityScore
(
	ActivityScoreID int not null,
	ActivityScore int not null,
	ActivityScoreDesc int not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.DisabilityType
(
	DisabilityTypeID int not null,
	DisabilityType varchar(50) not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.Goal
(
	GoalID int not null,
	Goal varchar(100) not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.DisabilityLevel
(
	DisabilityLevelID int not null,
	[Level] int not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.ActivityType
(
	ActivityTypeID int not null,
	ActivityName varchar(50) not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

create table sped.ActivityStatus
(
	ActivityStatusID int not null,
	ActivityStatus varchar(30) not null,
	CreatedBy varchar(100) not null,
	CreatedDate date not null,
	ModifiedBy varchar(100) not null,
	ModifiedDate date not null
)
go

----------------------------------------------

ALTER TABLE sped.Activity
ADD CONSTRAINT Pk_EmpClientActivity PRIMARY KEY (EmpCLientActivityID)
GO

ALTER TABLE sped.ActivityStatus
ADD CONSTRAINT Pk_ActivityStatus PRIMARY KEY (ActivityStatusID)
GO

ALTER TABLE sped.ActivityType
ADD CONSTRAINT Pk_ActivityType PRIMARY KEY (ActivityTypeID)
GO

ALTER TABLE sped.ActivityScore
ADD CONSTRAINT Pk_ActivityScore PRIMARY KEY (ActivityScoreID)
GO

ALTER TABLE sped.Employee
ADD CONSTRAINT Pk_Employee PRIMARY KEY (EmployeeID)
GO

ALTER TABLE sped.DisabilityType
ADD CONSTRAINT Pk_DisabilityType PRIMARY KEY (DisabilityTypeID)
GO

ALTER TABLE sped.DisabilityLevel
ADD CONSTRAINT Pk_DisabilityLevel PRIMARY KEY (DisabilityLevelID)
GO

ALTER TABLE sped.Goal
ADD CONSTRAINT Pk_Goal PRIMARY KEY (GoalID)
GO

ALTER TABLE sped.ClientDisability
ADD CONSTRAINT Pk_ClientDisability PRIMARY KEY (ClientDisabilityID)
GO

ALTER TABLE sped.Client
ADD CONSTRAINT Pk_Client PRIMARY KEY (ClientID)
GO

------------------------------------------------------

alter table sped.Activity
add constraint Fk_Activity_ActivityScore foreign key (ActivityScoreid)
references sped.ActivityScore
go

alter table sped.Activity
add constraint Fk_Activity_ActivityStatus foreign key (ActivityStatusid)
references sped.ActivityStatus
go

alter table sped.Activity
add constraint Fk_Activity_Employee foreign key (Employeeid)
references sped.Employee
go

alter table sped.Activity
add constraint Fk_Activity_ActivityType foreign key (ActivityTypeid)
references sped.ActivityType
go

alter table sped.Activity
add constraint Fk_Activity_Client foreign key (Clientid)
references sped.Client
go

alter table sped.ClientDisability
add constraint Fk_ClientDisability_Client foreign key (ClientID)
references sped.Client
go

alter table sped.ClientDisability
add constraint Fk_ClientDisability_DisabilityType foreign key (DisabilityTypeID)
references sped.DisabilityType
go

alter table sped.ClientDisability
add constraint Fk_ClientDisability_Goal foreign key (GoalID)
references sped.Goal
go

alter table sped.ClientDisability
add constraint Fk_ClientDisability_DisabilityLevel foreign key (DisabilityLevelID)
references sped.DisabilityLevel
go


