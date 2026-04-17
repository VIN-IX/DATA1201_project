USE master;
GO

IF DB_ID('FinalProject') IS NOT NULL
BEGIN
    ALTER DATABASE [FinalProject] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [FinalProject];
END;
GO

CREATE DATABASE FinalProject;
GO

USE FinalProject;
GO

-- Enum tables
CREATE TABLE SpaceType (
    TypeID int IDENTITY(1,1) NOT NULL,
    Name varchar(25) NOT NULL,
    PRIMARY KEY (TypeID)
);

CREATE TABLE UserRole (
    TypeID int IDENTITY(1,1) NOT NULL,
    Name varchar(10) NOT NULL,
    PRIMARY KEY (TypeID)
);

CREATE TABLE Province (
    TypeID int IDENTITY(1,1) NOT NULL,
    Code char(2) NOT NULL,
    PRIMARY KEY (TypeID)
);

-- Data tables
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

CREATE TABLE [Location] (
    LocationID int IDENTITY(1,1) NOT NULL,
    Name varchar(50),
    Area_m2 decimal(10,2),
    Parking bit,
    PublicTransport bit,
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
    LeaseStart date,
    LeaseEnd date,
    DailyPrice decimal(10,2),
    PRIMARY KEY (WorkspaceID)
);

-- Foreign keys
ALTER TABLE [User]
ADD CONSTRAINT [FK_User_Role]
FOREIGN KEY (UserRole) REFERENCES [UserRole](TypeID);

ALTER TABLE [Location]
ADD CONSTRAINT [FK_Location_Owner]
FOREIGN KEY (Owner) REFERENCES [User](UserID);

ALTER TABLE [Location]
ADD CONSTRAINT [FK_Location_Province]
FOREIGN KEY (Province) REFERENCES [Province](TypeID);

ALTER TABLE [Workspace]
ADD CONSTRAINT [FK_Workspace_LocationID]
FOREIGN KEY (LocationID) REFERENCES [Location](LocationID);

ALTER TABLE [Workspace]
ADD CONSTRAINT [FK_Workspace_Type]
FOREIGN KEY (Type) REFERENCES [SpaceType](TypeID);
