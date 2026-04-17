USE master;
GO

--delete database if it already exists
IF  DB_ID('CoWorking') IS NOT NULL
    DROP DATABASE CoWorking;
GO

--create database and switch to it
CREATE DATABASE CoWorking;
GO

USE CoWorking;

--create tables for the database
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(12) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    UserRole INT REFERENCES Roles (RoleID) NOT NULL
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    LocationName NVARCHAR(100) NOT NULL,
    UserID INT REFERENCES Users (UserID),
    City NVARCHAR(50) NOT NULL,
    Street NVARCHAR(50) NOT NULL,
    Province NVARCHAR(2) NOT NULL,
    PostalCode NVARCHAR(6) NOT NULL,
    Neighbourhood NVARCHAR(50) DEFAULT NULL,
    Area INT NOT NULL,
    Parking BIT NOT NULL,
    Transit BIT NOT NULL
);

CREATE TABLE SpaceTypes (
    TypeID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Workspaces (
    WorkspaceID INT PRIMARY KEY IDENTITY(1,1),
    LocationID INT REFERENCES Roles (RoleID),
    WorkspaceName NVARCHAR(50) NOT NULL,
    WorkspaceType INT REFERENCES SpaceTypes (TypeID) NOT NULL,
    Seating INT DEFAULT NULL,
    LeaseStart DATETIME DEFAULT NULL,
    LeaseEnd DATETIME DEFAULT NULL,
    LeasePrice MONEY DEFAULT 0.00,
);


