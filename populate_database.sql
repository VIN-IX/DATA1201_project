-- Setup enums
INSERT INTO [SpaceType](Name)
VALUES
    ('Office'),
    ('Meeting Room'),
    ('Study Space'),
    ('Desk'),
    ('Private Office Room');

INSERT INTO [UserRole](Name)
VALUES
    ('Owner'),
    ('Coworker');

INSERT INTO [Province](Code)
VALUES
    ('BC'),
    ('AB'),
    ('MB'),
    ('NB'),
    ('NL'),
    ('NT'),
    ('NS'),
    ('NU'),
    ('ON'),
    ('PE'),
    ('QC'),
    ('SK'),
    ('YT');

-- Users
INSERT INTO [User](FirstName, LastName, PhoneNumber, Email, UserRole)
VALUES
    ('Jim', 'Jim', '123-456-7890', 'jim@fakeemail.ca', 1),
    ('Bob', NULL, '098-765-4321', 'bob@fakeemail.ca', 2),
    ('Stanley', 'Furgeson', '111-111-1111', NULL, 1),
    ('Joe', 'Schmoe', NULL, 'joe@fakeemail.ca', 2),
    ('Jane', 'Doe', '890-115-7809', NULL, 2);

-- Locations
INSERT INTO [Location](Name, City, Street, Province, PostalCode, Neighborhood, Area_m2, Parking, PublicTransport, Owner)
VALUES
    ('Downtown Hub', 'Calgary', '8 Ave SW', 2, 'T2P1B9', 'Downtown', 1500.00, 1, 1, 1),
    ('Tech', 'Vancouver', 'Granville St', 1, 'V6Z1K3', 'Yaletown', 1200.00, 0, 1, 1),
    ('Creative', 'Toronto', 'King St W', 9, 'M5V3C6', 'King West', 1800.00, 1, 1, 3),
    ('Studio', 'Edmonton', 'Jasper Ave', 2, 'T5J1N9', 'Downtown', 1400.00, 1, 0, 3),
    ('Loft', 'Montreal', 'Rue Saint', 11, 'H3B1A7', 'Ville-Marie', 1600.00, 0, 1, 1);

-- Workspaces
INSERT INTO [Workspace](LocationID, Name, Type, Seating, LeaseStart, LeaseEnd, DailyPrice)
VALUES
    (1, 'Cozy Office', 1, 4, '2026-01-15', '2026-02-28', 35.00),
    (1, 'Small Meeting Room', 2, 8, '2026-01-10', '2026-03-01', NULL),
    (2, 'Large Office', 1, 10, NULL, NULL, 50.00),
    (3, 'Cubicle Office Space', 1, 10, '2026-03-10', NULL, 50.00),
    (4, 'Open Meeting Room', 2, 14, NULL, NULL, 40.00);
