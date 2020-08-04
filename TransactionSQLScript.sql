-- Two statements that drop the two stored procedures that you are going to create.
DROP PROCEDURE NewDiverNoError;
DROP PROCEDURE NewDiverException;

-- A statement to create a stored procedure with handlers for sqlexception and sqlwarning that will not trigger an exception when called.

Delimiter //

CREATE PROCEDURE NewDiverNoError()
BEGIN
DECLARE exit handler for sqlexception
BEGIN
  ROLLBACK;
   SELECT 'sql exception';
END;

DECLARE exit handler for sqlwarning
BEGIN
  ROLLBACK;
  SELECT 'sql warning';
END;

START TRANSACTION;

INSERT INTO PROJECT_Contact (lastName, firstName, phone, email, address, birthday)
values
('Smith', 'Morgan', '864-7012', 'morgansmith@tamu.edu', '7841 Newport Rd', '1988-03-09'),
('Thompson', 'Nell', '765-1209', 'nellthompson@yahoo.com', '7841 Newport Rd', NULL);

INSERT INTO PROJECT_Diver (contactID, emergencyContactID, classification, DANno, DANexpiration, active)
values
(21, 22, 'Level_1', 7820, '2020-11-02', 'y');

INSERT INTO PROJECT_Diver_to_Cert (diverID, title, instructor, certDate, agency, certNo)
values
(12, 'Full Cave', 'Greg Stanton', '2010-10-12', 'NSS-CDS', '8971'),
(12, 'Decompression Procedures', 'Greg Stanton', '2010-09-02', 'NSS-CDS', '9065'),
(12, 'Normoxic Trimix', 'James Draker', '2017-12-23', 'TDI', '86789'),
(12, 'Hypoxic Trimix', 'James Draker', '2017-12-31', 'TDI', '76513'),
(12, 'Overhead DPV', 'Ted McCoy', '2018-12-19', 'TDI', '71123'),
(12, 'Rebreather', 'Ted McCoy', '2019-03-18', 'TDI', '85412');

END //

Delimiter  ;


-- A statement to create a stored procedure with handlers for sqlexception and sqlwarning that will trigger an exception when called.

Delimiter //

CREATE PROCEDURE NewDiverException()
BEGIN
DECLARE exit handler for sqlexception
BEGIN
  ROLLBACK;
    SELECT 'sql exception';
END;

DECLARE exit handler for sqlwarning
BEGIN
   ROLLBACK;
     SELECT 'sql warning';
END;

START TRANSACTION;

INSERT INTO PROJECT_Contact (contactID, lastName, firstName, phone, email, address, birthday)
values
('Davidson', 'Kelvin', '901-8787', 'keldavidson@yahoo.com', 'Avenida Obregon 900', '1973-09-09'),
('Davidson', 'Anabel', '545-8007', 'anabeldavidson@gmail.com', 'Avenida Obregon 900', '1963-02-28');

-- These two inserts will generate exceptions as the diverID values are nonunique
INSERT INTO PROJECT_Diver (diverID, contactID, emergencyContactID, classification, DANno, DANexpiration, active)
values
(1, 23, 24, 'Level_1', 9087, '2020-10-10', 'y'),
(2, 24, 23, 'Level_1', 7812, '2020-10-10', 'y');

END //

Delimiter ;

-- Two statements that call the two stored procedure that you created.

CALL NewDiverNoError();
CALL NewDiverException();


