-- clean all records from all tables
DELETE FROM PROJECT_Log_to_Gas;
DELETE FROM PROJECT_Gas;
DELETE FROM PROJECT_Log_to_Diver;
DELETE FROM PROJECT_DiveLog;
DELETE FROM PROJECT_Site_to_Cert;
DELETE FROM PROJECT_DiveSites;
DELETE FROM PROJECT_Permits;
DELETE FROM PROJECT_Diver_to_Cert;
DELETE FROM PROJECT_Diver;
DELETE FROM PROJECT_CertsAndSpecialties;
DELETE FROM PROJECT_Contact;

-- insert 20 records into Contact table
Insert into PROJECT_Contact (lastName, firstName, phone, email, address, birthday)
values
('Battle', 'Laura', '123-4567', 'lbattle@yahoo.com', '123 1st Ave.', '1983-01-31'),
('Moore', 'David', '546-4567', 'dmoore@gmail.com', '123 1st Ave.', '1973-02-28'),
('Crawford', 'Rick', '907-4567', 'rcrawford@yahoo.com', '876 Birch Ln', '1960-03-25'),
('Crawford', 'Barrie', '999-8745', 'bcarwford@hotmail.com', '876 Birch Ln', NULL),
('Turner', 'Matthew', '111-4567', 'mturner@gmail.com', '907 80th Ave.', '1980-04-22'),
('Tobin', 'Mary', '807-6543', 'mtobin@gmail.com', '8769 Falls St', NULL),
('Bull', 'Matthew', '109-4567', 'mbull@yahoo.com', '4333 Elm Lane', '1978-05-18'),
('Bull', 'Michelle', '976-8888', 'michelle@fsu.edu', '4333 Elm Lane', NULL),
('Mille', 'Keith', '768-4567', 'kmille@gmail.com', '999 Essex', '1970-06-14'),
('Mille', 'Leslie', '765-1212', 'lmille@fsu.edu', '999 Essex', NULL),
('Sorenson', 'Edd', '993-4567', 'esorenson@yahoo.com', '776 Mill Pond Lane', '1960-07-10'),
('Martin', 'Stacy', '988-7866', 'stacymartin@hotmail.com', '776 Mill Pond Lane', '1970-12-09'),
('Davidson', 'Kim', '167-4567', 'kdavidson@yahoo.com', 'Avenida Obregon 2', '1979-08-06'),
('Ana', 'Torres', '991-0876', 'atorres@gmail.com', 'Avenida Obregon 2', NULL),
('Krejca', 'Jean', '547-4567', 'creature@gmail.com', '675 Lavaca', '1974-09-03'),
('Hager', 'Kristina', '876-0909', 'khager@gmail.com', '675 Lavaca', NULL),
('Berrones', 'Oscar', '342-4567', 'oberronese@gmail.com', '700 Mockingbird', '1966-10-01'),
('Berrones', 'Sally', '907-6332', 'sberrones@yahoo.com', '700 Mockingbird', NULL),
('Smith', 'John', '908-8766', 'jsmith@floridaparks.gov', '1200 Monroe', NULL),
('Anderson', 'Sarita', '778-7888', 'sanderson@blm.gov', '1500 Washington', NULL);

-- insert records into Certs and specialties table
Insert into PROJECT_CertsAndSpecialties (title)
values
('Full Cave'),
('Decompression Procedures'),
('Normoxic Trimix'),
('Hypoxic Trimix'),
('Overhead DPV'),
('Rebreather');

-- insert 10 records into Diver table                                                                                                                                                              
Insert into PROJECT_Diver (contactID, emergencyContactID, classification, DANno, DANexpiration, active, medicalAlerts)
values
(1, 2, 'Level_2', 6778, '2020-09-01', 'y', 'allergic to sulfa'),
(2, 1, 'Level_3', 6779, '2020-09-01', 'y', NULL),
(3, 4, 'Level_2', 8787, '2020-08-26', 'y', 'heart valve replaced'),
(5, 6, 'Level_1', 8013, '2020-12-18', 'y', NULL),
(7, 8, 'Support', 9801, '2020-03-10', 'y', NULL),
(9, 10, 'Level_1', 7643, '2020-05-14', 'y', 'allergic to penicillin'),
(11, 12, 'Level_3', 2908, '2020-02-27', 'y', NULL),
(13, 14, 'Level_3', 3358, '2020-11-09', 'y', NULL),
(15, 16, 'Level_2', 6589, '2020-03-25', 'y', NULL),
(17, 18, 'Support', 5542, '2018-10-11', 'n', 'knee replacement'),
(8, 7, 'Support', 9802, '2020-03-10', 'y', NULL);

-- insert records into Diver_to_Cert
Insert into PROJECT_Diver_to_Cert (diverID, title, instructor, certDate, agency, certNo)
values
(1, 'Full Cave', 'German Yanez', '2013-06-14', 'TDI' , '98012'),
(1, 'Decompression Procedures', 'Kelvin Davidson', '2014-11-23', 'IANTD', '97561'),
(1, 'Normoxic Trimix', 'Kelvin Davidson', '2014-11-23', 'IANTD', '34561'),
(1, 'Overhead DPV', 'Edd Sorenson', '2016-06-10', 'PSAI', '8913'),
(2, 'Full Cave', 'Shannon Wallace', '2005-06-14', 'TDI' , '65231'),
(2, 'Decompression Procedures', 'Shannon Wallace', '2005-11-12', 'TDI', '23098'),
(2, 'Normoxic Trimix', 'Shannon Wallace', '2005-11-12', 'TDI', '33592'),
(2, 'Hypoxic Trimix', 'Shannon Wallace', '2006-01-23', 'TDI', '11909'),
(2, 'Overhead DPV', 'Shannon Wallace', '2006-02-10', 'TDI', '54333'),
(3, 'Full Cave', 'Henry Nicholson', '1987-02-10', 'NACD' , '287'),
(3, 'Decompression Procedures', 'Henry Nicholson', '1987-04-115', 'NACD' , '456'),
(3, 'Normoxic Trimix', 'Sheck Exley', '1990-08-01', 'NACD', '120'),
(3, 'Hypoxic Trimix', 'Sheck Exley', '1990-08-01', 'NACD', '121'),
(3, 'Overhead DPV', 'Edd Sorenson', '2016-06-10', 'PSAI', '8913'),
(4, 'Full Cave', 'German Yanez', '2013-02-12', 'TDI', '97999'),
(4, 'Decompression Procedures', 'Rich Courtney', '2013-12-20', 'TDI', '90548'),
(4, 'Normoxic Trimix', 'Rich Courtney', '2013-12-20', 'TDI', '87888'),
(4, 'Hypoxic Trimix', 'James Draker', '2016-03-12', 'TDI', '65555'),
(4, 'Overhead DPV', 'Edd Sorenson', '2014-03-15', 'NSS-CDS', '5432'),
(4, 'Rebreather', 'Edd Sorenson', '2016-01-03', 'PSAI', '98870'),
(5, 'Full Cave', 'Greg Stanton', '2009-05-05', 'NSS-CDS', '9887'),
(5, 'Decompression Procedures', 'Greg Stanton', '2009-03-21', 'NSS-CDS', '6721'),
(6, 'Full Cave', 'Greg Stanton', '1998-10-28', 'NACD', '77654'),
(6, 'Decompression Procedures', 'Greg Stanton', '2005-11-03', 'PSAI', '45210'),
(6, 'Normoxic Trimix', 'Greg Stanton', '2005-11-03', 'PSAI', '99872'),
(7, 'Full Cave', 'Larry Green', '1992-02-27', 'TDI', '37999'),
(7, 'Decompression Procedures', 'Lamar Hires', '1997-04-18', 'TDI', '37151'),
(7, 'Normoxic Trimix', 'Lamar Hires', '1997-04-18', 'TDI', '77601'),
(7, 'Hypoxic Trimix', 'Lamar Hires', '1999-08-02', 'TDI', '32341'),
(7, 'Overhead DPV', 'Hal Watts', '1995-09-09', 'TDI', '1389'),
(7, 'Rebreather', 'Larry Green', '2006-02-01','TDI', '8870'),
(8, 'Full Cave', 'Bil Phillips', '2003-09-25', 'IANTD', '43442'),
(8, 'Decompression Procedures', 'Bil Phillips', '2004-02-03', 'IANTD', '53782'),
(8, 'Normoxic Trimix', 'Andreas Matthes', '2005-07-02', 'IANTD', '89712'),
(8, 'Hypoxic Trimix', 'Andreas Matthes', '2005-07-02', 'IANTD', '98776'),
(8, 'Overhead DPV', 'Bil Phillips', '2004-08-21', 'TDI', '89765'),
(8, 'Rebreather', 'Andreas Matthes', '2011-04-04', 'IANTD', '98112'),
(9, 'Full Cave', 'Larry Green', '2002-01-05', 'IANTD', '96665'),
(9, 'Decompression Procedures', 'Paul Heinerth', '2004-11-01', 'IANTD', '76611'),
(9, 'Rebreather', 'Bill Stone', '2009-11-06', 'Poseidon', '87776'),
(10, 'Full Cave', 'German Yanez', '2013-02-12', 'TDI', '97998');

-- insert a few records into Permit table
Insert into PROJECT_Permits (permitNo, issuingEntity, contactID, dateIssued, dateExpires, siteConstraints, objectives, deliverables)
values
('AZ3491-023', 'Bureau of Land Management', 20, '2019-01-01', '2021-01-01', 
'Must schedule two weeks ahead of time, only two vehicles on site', 'survey, sketch', 'vectorized PDF map' ),
('DEP-65203', 'Florida Department of Environmental Protection', 19, '2019-01-01', '2020-01-01', 
'Must schedule on weekdays 72 hours in advance', 'dye trace', 'dye trace report');

-- insert 10 records into Dive Sites table
Insert into PROJECT_DiveSites (siteName, gps, county, owner, hours, maxDepth, permitID)
values
('Madison Blue', '30.480308, -83.24449', 'Madison', 'Florida State Parks', 'sunrise to sunset', 130, NULL),
('Peacock I', '30.12297, -83.13297', 'Suwannee', 'Florida State Parks', 'sunrise to sunset', 175, NULL),
('Jackson Blue', '30.79013, -85.14015', 'Jackson', 'Jackson County', '24 hour access', 105, NULL),
('Devils', '29.83509, -82.69659', 'Gilchrist', 'Ginnie Springs Outdoors, LLC', '24 hour access', 173, NULL),
('Cow', '30.106298, -83.11244', 'Suwannee', 'NSS-CDS', '24 hour access', 110, NULL),
('Bozel', '30.830501, -85.234453', 'Jackson', 'Public waterway', '24 hour access', 110, NULL),
('Sally Ward', '30.240935, -84.310562', 'Wakulla', 'Florida State Parks', 'Arranged by permit', 350, 2),
('Sullivan', '30.30881, -84.35911', 'Leon', 'National Forest Service', 'Arranged by permit', 225, 1),
('Emerald', '30.29556, -84.35225', 'Wakulla', 'Florida State Parks', 'sunrise to sunset', 180, 2),
('Hole in the Wall', '30.783262, -85.156198', 'Jackson', 'Public waterway', '24 hour access', 110, NULL),
('Indian Springs', '30.25069, -84.32214', 'Wakulla', 'Privately owned', 'No access currently', 250, NULL);

-- insert records for intersection between sites and certs
Insert into PROJECT_Site_to_Cert(siteID, title)
values
(1, 'Full Cave'),
(2, 'Full Cave'),
(3, 'Full Cave'),
(4, 'Full Cave'),
(5, 'Full Cave'),
(6, 'Full Cave'),
(7, 'Full Cave'),
(8, 'Full Cave'),
(9, 'Full Cave'),
(10, 'Full Cave'),
(8, 'Normoxic Trimix'),
(7, 'Hypoxic Trimix'),
(3, 'Decompression Procedures'),
(4, 'Decompression Procedures'),
(5, 'Decompression Procedures'),
(6, 'Decompression Procedures'),
(3, 'Overhead DPV'),
(4, 'Overhead DPV'),
(7, 'Overhead DPV'),
(8, 'Overhead DPV');

-- insert 10 records into DiveLog table
Insert into PROJECT_DiveLog(siteID, diveDate, runTime, maxDepth, teamExpenses, description)
values
(7, '2019-01-05', 250, 345, 662.90, 'Edd and David dropped safety bottles (2 per) for the season at 350, 300, 240 and 190'),
(7, '2019-01-06', 50, 120, 56.72, 'Matt and Keith dropped safety bottles (2 per) at 120 and 70 for the season'),
(8, '2019-01-25', 165, 135, 23.65, 'Laura and David checked and fixed the line in preparation for survey'),
(7, '2019-02-12', 197, 225, 43.78,'Kim and Edd did a radiolocation at the end of upstream tunnel'),
(7, '2019-02-12', 167, 234, 0, 'David and Keith dropped dye packets at the end of the downstream tunnel'),
(4, '2019-02-28', 114, 98, 52.48, 'Rick and Matt scootered Sweet Surprise/Mainland circuit'),
(9, '2019-03-01', 92, 87, 231.75, 'Jean and Laura tested out the new ScubaPro sonar side scanners for survey'),
(3, '2019-03-21', 144, 94, 24.31, 'Edd and Laura surveyed a new side passage in the beginning of JB3'),
(8, '2019-03-28', 153, 131, 89.62, 'Laura and David surveyed with LRUDs from the Weird Room backwards 865 feet'),
(8, '2019-03-28', 97, 132, 27.99, 'Matt and Keith surveyed from the 130ft tunnel upstream with LRUDs 792 feet'),
(2, '2019-03-29', 64, 72, 0, 'Michelle and Matt did buddy drills on the way back from Challenge');

-- insert intersection table for Log and diver
Insert into PROJECT_Log_to_Diver(diveID, diverID)
values
(1, 2),
(1, 7),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(4, 7),
(4, 8),
(5, 2),
(5, 6),
(6, 3),
(6, 4),
(7, 1),
(7, 9),
(8, 1),
(8, 7),
(9, 1),
(9, 2),
(10, 4),
(10, 6),
(11, 11),
(11, 5);

-- insert records for gas table
Insert into PROJECT_Gas(o2, he, maxDepth, ceiling)
values
(100, 0, 20, NULL),
(50, 0, 70, NULL),
(32, 0, 120, NULL),
(35, 25, 120, NULL),
(16, 55, 240, 10),
(12, 60, 300, 20),
(10, 70, 350, 30); 

-- insert records for intersection between log and gas
Insert into PROJECT_Log_to_Gas(diveID, o2, he)
values
(1, 100, 0),
(1, 50, 0),
(1, 35, 25),
(1, 16, 55),
(1, 12, 60),
(1, 10, 70),
(2, 32, 0),
(3, 100, 0),
(3, 32, 0),
(3, 16, 55),
(4, 16, 55),
(4, 35, 25),
(4, 50, 0),
(4, 100, 0),
(5, 16, 55),
(5, 35, 25),
(5, 50, 0),
(5, 100, 0),
(6, 100, 0),
(6, 32, 0),
(7, 32, 0),
(8, 100, 0),
(8, 32, 0),
(9, 100, 0),
(9, 35, 25),
(9, 32, 0),
(10, 100, 0),
(10, 35, 25),
(10, 32, 0),
(11, 32,0);

-- Update statements for 4 tables
UPDATE PROJECT_Diver
SET classification = 'Level_1'
WHERE diverID = 5;

UPDATE PROJECT_Contact
SET phone = '907-4231'
WHERE contactID = 13;

UPDATE PROJECT_DiveSites
SET siteName = 'Cow Springs'
WHERE siteName = 'Cow';

UPDATE PROJECT_DiveLog
SET teamExpenses = 13.42
WHERE diveID = 5;

-- Delete statements for 4 tables
DELETE FROM PROJECT_Diver
WHERE diverID = 10;

DELETE FROM PROJECT_Contact
WHERE contactID = 18;

DELETE FROM PROJECT_DiveSites
WHERE siteID = 11;

DELETE FROM PROJECT_DiveLog
WHERE diveID = 11;


