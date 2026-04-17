-- Q1
GO
CREATE VIEW OwnerContactInfo AS
	SELECT UserID, FirstName, LastName, PhoneNumber, Email, UserRole
	FROM [User]
	WHERE UserID = 1;
GO

SELECT * FROM [OwnerContactInfo];

-- Q2
GO
CREATE VIEW ViewWorkspaceDetails AS
	SELECT Name, Type, Seating, DailyPrice
	FROM Workspace;
GO

SELECT * FROM [ViewWorkspaceDetails];

-- Q3
SELECT Name, City, Area_m2 FROM Location
WHERE City = 'calgary' AND Parking = 1
ORDER BY Area_m2 DESC;
