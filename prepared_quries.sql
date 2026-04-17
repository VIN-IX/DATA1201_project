-- Q1
GO
CREATE VIEW OwnerContactInfo AS
	SELECT UserID, FirstName, LastName, PhoneNumber, Email, UserRole
	FROM [User]
	WHERE UserRole = 1;
GO

SELECT * FROM [OwnerContactInfo];

-- Q2
GO
CREATE VIEW ViewWorkspaceDetails AS
SELECT
    w.WorkspaceID,
    w.Name,
    s.Name AS SpaceType,
    w.Seating,
    w.DailyPrice,
    w.LeaseStart,
    w.LeaseEnd,
    w.LocationID
FROM Workspace w
JOIN SpaceType s
    ON w.Type = s.TypeID;
GO

SELECT * FROM [ViewWorkspaceDetails];

-- Q3
SELECT Name, City, Area_m2
FROM Location
WHERE City = 'Calgary'
  AND Parking = 1
ORDER BY Area_m2 DESC;
