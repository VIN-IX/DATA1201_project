USE master;

IF DB_ID('FinalProject') IS NOT NULL
	ALTER DATABASE [FinalProject] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [FinalProject];

CREATE DATABASE FinalProject;
USE FinalProject;

-- Enum tables
CREATE TABLE SpaceType (
	TypeID int IDENTITY(1, 1) NOT NULL,
	Name varchar(15) NOT NULL,

	PRIMARY KEY (TypeID)
);

CREATE TABLE UserType (
	TypeID int IDENTITY(1, 1) NOT NULL,
	Name varchar(10) NOT NULL,

	PRIMARY KEY (TypeID)
);

-- Setup enums
INSERT INTO SpaceType (Name) VALUES ('Meeting'), ('PrivateOffice'), ('OpenArea');
INSERT INTO UserType (Name) VALUES ('Coworker'), ('Owner');

-- Data tables
CREATE TABLE [Location] (
	LocationID int IDENTITY(1, 1) NOT NULL,
	Name varchar(50),
	Area_m2 Numeric,
	Parking Bit,
	PublicTransport Bit,
	Owner int,

	City varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
	Province varchar(50) NOT NULL,
	PostalCode varchar(6) NOT NULL,
	Neighborhood varchar(50) NOT NULL,

	PRIMARY KEY (LocationID)
);

CREATE TABLE [Workspace] (
	WorkspaceID int IDENTITY(1,1) NOT NULL,
	LocationID int NOT NULL,
	Type int NOT NULL,

	PRIMARY KEY (WorkspaceID)
);

CREATE TABLE [User] (
	UserID int IDENTITY(1,1) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	PhoneNumber int,
	Email varchar(50),
	Profession varchar(50),
	Role int NOT NULL,
	LocationID int,
	WorksapceID int,

	PRIMARY KEY (UserID)
);

ALTER TABLE [Location] ADD CONSTRAINT [FK_Location_Owner] FOREIGN KEY (Owner) REFERENCES [User](UserID);

ALTER TABLE [Workspace] ADD CONSTRAINT [FK_Workspace_LocationID] FOREIGN KEY (LocationID) REFERENCES [Location](LocationID);
ALTER TABLE [Workspace] ADD CONSTRAINT [FK_Workspace_Type] FOREIGN KEY (Type) REFERENCES [SpaceType](TypeID);

ALTER TABLE [User] ADD CONSTRAINT [FK_User_Role] FOREIGN KEY (Role) REFERENCES [UserType](TypeID);
ALTER TABLE [User] ADD CONSTRAINT [FK_User_LocationID] FOREIGN KEY (LocationID) REFERENCES [Location](LocationID);
ALTER TABLE [User] ADD CONSTRAINT [FK_User_WorkspaceID] FOREIGN KEY (WorksapceID) REFERENCES [Workspace](WorkspaceID);
