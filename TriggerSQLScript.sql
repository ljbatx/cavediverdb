--Drop Log table statement
DROP TABLE IF EXISTS PROJECT_TransactionLog;

--A SQL statement that creates the Log table
CREATE TABLE PROJECT_TransactionLog(
USER VARCHAR(20),
TableName VARCHAR(50),
ActionName VARCHAR(30),
PKRecord VARCHAR(150),
ActionTime DateTime
);
 
--Three statements that drop the three triggers (referred to below as Trigger1, Trigger2, and Trigger3)
DROP TRIGGER IF EXISTS PROJECT_InsertDive;
DROP TRIGGER IF EXISTS PROJECT_UpdateDive;
DROP TRIGGER IF EXISTS PROJECT_DeleteDive;

--A trigger that fires on an insert (referred to later as Trigger1)
Delimiter $$

CREATE TRIGGER PROJECT_InsertDive
After Insert
ON PROJECT_DiveLog
FOR EACH ROW
Begin
Select concat('diveID = ', New.diveID) into @PKRecord;

INSERT INTO PROJECT_TransactionLog(USER, TableName, ActionName, PKRecord, ActionTime)
VALUES
('Battle', 'PROJECT_DiveLog', 'Insert', @PKRecord, Now());

End $$

Delimiter ;

--A trigger that fires on an update (referred to later as Trigger2)

Delimiter $$

CREATE TRIGGER PROJECT_UpdateDive
Before Update
ON PROJECT_DiveLog
FOR EACH ROW
Begin
Select concat('diveID = ', Old.diveID) into @PKRecord;

INSERT INTO PROJECT_TransactionLog(USER, TableName, ActionName, PKRecord, ActionTime)
VALUES
('Battle', 'PROJECT_DiveLog', 'Update', @PKRecord, Now());

End $$

Delimiter ;

--A trigger that fires on a delete (referred to later as Trigger3)

Delimiter $$

CREATE TRIGGER PROJECT_DeleteDive
Before Delete
ON PROJECT_DiveLog
FOR EACH ROW
Begin
Select concat('diveID = ', Old.diveID) into @PKRecord;

INSERT INTO PROJECT_TransactionLog(USER, TableName, ActionName, PKRecord, ActionTime)
VALUES
('Battle', 'PROJECT_DiveLog', 'Delete', @PKRecord, Now());

End $$

Delimiter ;

--A SQL statement that causes Trigger1 to fire
INSERT INTO PROJECT_DiveLog (siteID, diveDate, runTime, maxDepth, teamExpenses, description)
VALUES
(10, '2020-07-04', 93, 107, 100, 'David and Laura scootered upstream to first T and took Century Tunnel to Big Ben');
--A SQL statement that validates that Trigger1 was fired
SELECT * FROM PROJECT_TransactionLog;
SELECT * FROM PROJECT_DiveLog;
--A SQL statement that causes Trigger2 to fire
UPDATE PROJECT_DiveLog
SET runTime = 89
WHERE diveDate = '2020-07-04';
--A SQL statement that validates that Trigger2 was fired
SELECT * FROM PROJECT_TransactionLog;
SELECT * FROM PROJECT_DiveLog;
--A SQL statement that causes Trigger3 to fire
DELETE FROM PROJECT_DiveLog
WHERE diveDate = '2020-07-04';
--A SQL statement that validates that Trigger3 was fired
SELECT * FROM PROJECT_TransactionLog;
SELECT * FROM PROJECT_DiveLog;
--A SQL select statement showing the records in the data log table
SELECT * FROM PROJECT_TransactionLog;
