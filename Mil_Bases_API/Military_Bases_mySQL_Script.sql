CREATE DATABASE FRL_Project2_db;
USE FRL_Project2_db;

CREATE TABLE mil_base(
	Site_Name VARCHAR(70) PRIMARY KEY,
	State VARCHAR(30),
    Operational_Status VARCHAR(30),
    Component VARCHAR(40),
    Latitude FLOAT,
    Longitude FLOAT,
    Country VARCHAR(20)
);


# Add the Latitude and Longitude to the 18 bases the API did not have geo_point_2d
# 1 Pearl City
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Pearl City';

-- UPDATE mil_base
--    SET Latitude = 21.3972222,
--        Longitude = -157.9733333
--  WHERE Site_Name = 'Pearl City';

-- # 2 Yakima Training Center
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Yakima Training Center';

-- UPDATE mil_base
--    SET Latitude = 46.7610267,
--        Longitude = -120.191295
--  WHERE Site_Name = 'Yakima Training Center';

-- # 3 Fort Polk
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Fort Polk';

-- UPDATE mil_base
--    SET Latitude = 30.9874939,
--        Longitude = -93.0500375 
--  WHERE Site_Name = 'Fort Polk';

-- # 4 Langley AFB
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Langley AFB';

-- UPDATE mil_base
--    SET Latitude = 37.0827735,
--        Longitude = -76.362001 
--  WHERE Site_Name = 'Langley AFB';

-- # 5 Schofield Bks Military Reservation
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Schofield Bks Military Reservation';

-- UPDATE mil_base
--    SET Latitude = 21.5004552,
--        Longitude = -158.0778105
--  WHERE Site_Name = 'Schofield Bks Military Reservation';
--  
--  # 6 Eglin AFB
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Eglin AFB';

-- UPDATE mil_base
--    SET Latitude = 30.5711454,
--        Longitude = -86.544766
--  WHERE Site_Name = 'Eglin AFB';

-- # 7 Fort Lewis
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Fort Lewis';

-- UPDATE mil_base
--    SET Latitude = 47.0617116,
--        Longitude = -122.583444
--  WHERE Site_Name = 'Fort Lewis';

-- # 8 MTA Fort Wm Henry Harrison
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'MTA Fort Wm Henry Harrison';

-- UPDATE mil_base
--    SET Latitude = 46.6159,
--        Longitude = -112.137
--  WHERE Site_Name = 'MTA Fort Wm Henry Harrison';

-- # 9 MTC-H Camp Grayling
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'MTC-H Camp Grayling';

-- UPDATE mil_base
--    SET Latitude = 44.661404,
--        Longitude = -84.714752
--  WHERE Site_Name = 'MTC-H Camp Grayling';

-- # 10 Fort Belvoir
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Fort Belvoir';

-- UPDATE mil_base
--    SET Latitude = 38.7188716,
--        Longitude = -77.1542684
--  WHERE Site_Name = 'Fort Belvoir';

-- # 11 Fort Leonard Wood
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Fort Leonard Wood';

-- UPDATE mil_base
--    SET Latitude = 37.7252315,
--        Longitude = -92.1646722
--  WHERE Site_Name = 'Fort Leonard Wood';

-- # 12 Point Of Marsh Target
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Point Of Marsh Target';

-- UPDATE mil_base
--    SET Latitude = 34.9658724,
--        Longitude = -76.459641
--  WHERE Site_Name = 'Point Of Marsh Target';

-- # 13 NAS Kingsville
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'NAS Kingsville';

-- UPDATE mil_base
--    SET Latitude = 27.500863,
--        Longitude = -97.810046
--  WHERE Site_Name = 'NAS Kingsville';

-- # 14 NAS Pensacola
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'NAS Pensacola';

-- UPDATE mil_base
--    SET Latitude = 30.433283,
--        Longitude = -87.240372
--  WHERE Site_Name = 'NAS Pensacola';

-- # 15 Fort Bragg
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Fort Bragg';

-- UPDATE mil_base
--    SET Latitude = 35.1380556,
--        Longitude = -79.0075
--  WHERE Site_Name = 'Fort Bragg';

-- # 16 Aliamanu Military Reservation
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'Aliamanu Military Reservation';

-- UPDATE mil_base
--    SET Latitude = 21.3600123,
--        Longitude = -157.911836
--  WHERE Site_Name = 'Aliamanu Military Reservation';

-- # 17 NB Point Loma
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'NB Point Loma';

-- UPDATE mil_base
--    SET Latitude = 32.6770565,
--        Longitude = -117.244723
--  WHERE Site_Name = 'NB Point Loma';

-- # 18 North River Radio Relay Site
-- SELECT * FROM mil_base
-- WHERE Site_Name = 'North River Radio Relay Site';

-- UPDATE mil_base
--    SET Latitude = 63.888622,
--        Longitude = -160.518467
--  WHERE Site_Name = 'North River Radio Relay Site';

-- SELECT * FROM mil_base
-- WHERE Latitude = 0;

SELECT * FROM mil_base
