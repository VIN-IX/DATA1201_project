USE master;

IF DB_ID('FinalProject') IS NOT NULL
	ALTER DATABASE [FinalProject] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [FinalProject];

CREATE DATABASE FinalProject;
USE FinalProject;

-- Enum tables
CREATE TABLE SpaceType (
	TypeID int IDENTITY(1, 1) NOT NULL,
	Name varchar(25) NOT NULL,

	PRIMARY KEY (TypeID)
);

CREATE TABLE UserRole (
	TypeID int IDENTITY(1, 1) NOT NULL,
	Name varchar(10) NOT NULL,

	PRIMARY KEY (TypeID)
);

CREATE TABLE Province (
	TypeID int IDENTITY(1, 1) NOT NULL,
	Code char(2),

	PRIMARY KEY (TypeID)
);

-- Data tables
CREATE TABLE [Location] (
	LocationID int IDENTITY(1, 1) NOT NULL,
	UserID int,
	Name varchar(50),
	Area_m2 Numeric,
	Parking Bit,
	PublicTransport Bit,
	Owner int,

	City varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
	Province int NOT NULL,
	PostalCode varchar(6) NOT NULL,
	Neighborhood varchar(50) NOT NULL,

	PRIMARY KEY (LocationID)
);

CREATE TABLE [Workspace] (
	WorkspaceID int IDENTITY(1,1) NOT NULL,
	LocationID int NOT NULL,
	Name varchar(50),
	Type int NOT NULL,
	Seating int NOT NULL,
	LeaseStart DATE,
	LeaseEnd DATE,
	DailyPrice Numeric,

	PRIMARY KEY (WorkspaceID)
);

CREATE TABLE [User] (
	UserID int IDENTITY(1,1) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50),
	PhoneNumber varchar(20),
	Email varchar(50),
	Password varchar(50),
	UserRole int NOT NULL,

	PRIMARY KEY (UserID)
);

-- Foreign keys
ALTER TABLE [Location] ADD CONSTRAINT [FK_Location_Owner] FOREIGN KEY (Owner) REFERENCES [User](UserID);
ALTER TABLE [Location] ADD CONSTRAINT [FK_Location_Province] FOREIGN KEY (Province) REFERENCES [Province](TypeID);

ALTER TABLE [Workspace] ADD CONSTRAINT [FK_Workspace_LocationID] FOREIGN KEY (LocationID) REFERENCES [Location](LocationID);
ALTER TABLE [Workspace] ADD CONSTRAINT [FK_Workspace_Type] FOREIGN KEY (Type) REFERENCES [SpaceType](TypeID);

ALTER TABLE [User] ADD CONSTRAINT [FK_User_Role] FOREIGN KEY (Role) REFERENCES [UserRole](TypeID);
--ALTER TABLE [User] ADD CONSTRAINT [FK_User_LocationID] FOREIGN KEY (LocationID) REFERENCES [Location](LocationID);
--ALTER TABLE [User] ADD CONSTRAINT [FK_User_WorkspaceID] FOREIGN KEY (WorksapceID) REFERENCES [Workspace](WorkspaceID);
