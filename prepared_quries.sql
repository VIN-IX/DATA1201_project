-- Q1
IF OBJECT_ID('OwnerContactInfo', 'V') IS NOT NULL
    DROP VIEW OwnerContactInfo;
GO

CREATE VIEW OwnerContactInfo AS
SELECT
    u.UserID,
    u.FirstName,
    u.LastName,
    u.PhoneNumber,
    u.Email,
    ur.Name AS UserRole
FROM [User] u
INNER JOIN [UserRole] ur
    ON u.UserRole = ur.TypeID
WHERE ur.Name = 'Owner';
GO

SELECT * FROM [OwnerContactInfo];
GO

-- Q2
IF OBJECT_ID('ViewWorkspaceDetails', 'V') IS NOT NULL
    DROP VIEW ViewWorkspaceDetails;
GO

CREATE VIEW ViewWorkspaceDetails AS
SELECT
    w.WorkspaceID,
    w.Name,
    s.Name AS SpaceType,
    w.Seating,
    w.DailyPrice
FROM [Workspace] w
INNER JOIN [SpaceType] s
    ON w.Type = s.TypeID;
GO

SELECT * FROM [ViewWorkspaceDetails];
GO

-- Q3
SELECT Name, City, Area_m2
FROM [Location]
WHERE City = 'Calgary'
  AND Parking = 1
ORDER BY Area_m2 DESC;
