--Two statements that drop the two stored Procedures (referred to below as StoredProc1 and StoredProc2)
DROP PROCEDURE IF EXISTS PROJECT_Proc_Add_DiveLog;
DROP PROCEDURE IF EXISTS PROJECT_Proc_Add_Gas;

--A Stored Procedure (referred to later as StoredProc1) that takes in as parameters all attributes that are not auto-generated and validates each. Only inserts a record into a table if all the parameters are valid. 

DELIMITER $$

CREATE PROCEDURE PROJECT_Proc_Add_DiveLog
(
IN siteID1 INT,
IN diveDate1 DATE,
IN runTime1 INT,
IN maxDepth1 INT,
IN teamExpenses1 FLOAT,
IN description1 BLOB,
OUT OutComeMsg VARCHAR(150)
)
BEGIN

DECLARE DateDifference FLOAT;

SELECT DATEDIFF(diveDate1, now()) into DateDifference;

IF siteID1 < 0 OR siteID1 > 10 THEN
  SELECT "Invalid siteID" into OutComeMsg;
elseIF DateDifference > 0 THEN
  SELECT "Future dives cannot be logged" into OutComeMsg;
elseIf runTime1 > 500 OR runTime1 < 30 THEN
  SELECT "Invalid runtime" into OutComeMsg;
elseIf maxDepth1 > 350 OR maxDepth1 < 50 THEN
  SELECT "Invalid maxdepth" into OutComeMsg;
elseIf teamExpenses1 > 1000 THEN
  SELECT "Team expenses above maximum" into OutComeMsg;
elseIf isnull(description1) THEN
  SELECT "Please enter description" into OutComeMsg;
ELSE
  INSERT INTO PROJECT_DiveLog (siteId, diveDate, runTime, maxDepth, teamExpenses, description)
  VALUES (siteID1, diveDate1, runTime1, maxDepth1, teamExpenses1, description1);
  SELECT "Record added to PROJECT_DiveLog " into OutComeMsg;
END IF; 

END $$
DELIMITER ;

--A Stored Procedure (referred to later as StoredProc2) that takes in as parameters all attributes that are not auto-generated and validates each. Only inserts a record into a different table than the one used in StoredProc1 if all the parameters are valid. 

DELIMITER $$

CREATE PROCEDURE PROJECT_Proc_Add_Gas
(
IN oxygen INT,
IN helium INT,
IN maxDepth2 INT,
IN ceiling1 INT,
OUT OutComeMsg VARCHAR(150)
)
BEGIN

DECLARE oneSix FLOAT;
DECLARE gasSum INT;
DECLARE normoxic FLOAT;

SET oneSix = ((1.6 / (oxygen / 100) ) - 1) * 33;   /* protects against an oxygen toxicity hit */
SET normoxic = ((.18 / (oxygen / 100) ) - 1) * 33; /* protects against hypoxia */
SET gasSum = oxygen + helium; /* shouldn't exceed 100% */

IF oxygen < 5 OR oxygen > 100 THEN                    /* test 1 - make o2 content too low */
  SELECT "Invalid oxygen percentage" into OutComeMsg;
elseIf helium < 0 OR helium > 95 THEN                 /* test 2 - make helium content negative */
  SELECT "Invalid helium percentage" into OutComeMsg;
elseIf gasSum > 100 OR gasSum < 21 THEN               /* test 3 - make an invalid gas combo */
  SELECT "Invalid gas mixture" into OutComeMsg;
elseIf maxDepth2 > oneSix OR maxDepth2 < 20 THEN     /* test 4 - violate oxygen toxicity limits */
  SELECT "Invalid maxdepth" into OutComeMsg;
elseIf ceiling1 < normoxic OR ceiling1 < 0 THEN       /* test 5 - violate hypoxia limits */
  SELECT "Invalid O2 ceiling" into OutComeMsg;
ELSE
  INSERT INTO PROJECT_Gas (o2, he, maxDepth, ceiling)
  VALUES (oxygen, helium, maxDepth2, ceiling1);
  SELECT "Record added to PROJECT_Gas " into OutComeMsg;
END IF;

END $$
DELIMITER ;

--SQL statements that call StoredProc1 and validate each possible path 

CALL PROJECT_Proc_Add_DiveLog(11, '2020-07-04', 120, 90, 50.05, 'Test1', @OutComeMsg);
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_DiveLog(10, '2021-07-04', 120, 90, 50.05, 'Test2', @OutComeMsg);
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_DiveLog(10, '2020-07-04', 1000, 90, 50.05, 'Test3', @OutComeMsg);
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_DiveLog(10, '2020-07-04', 120, 1000, 50.05, 'Test4', @OutComeMsg);
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_DiveLog(10, '2020-07-04', 120, 90, 1000000 , 'Test5', @OutComeMsg);
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_DiveLog(10, '2020-07-04', 120, 90, 50.05, NULL , @OutComeMsg);
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_DiveLog(10, '2020-07-04', 120, 90, 50.05, 'Test7', @OutComeMsg);
SELECT @OutComeMsg;

--SQL statements that call StoredProc2 and validate each possible path

CALL PROJECT_Proc_Add_Gas(4, 90, 1120, 115, @OutComeMsg);    /* test 1 */
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_Gas(5, -1, 890, 80, @OutComeMsg);      /* test 2 */
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_Gas(32, 70, 120, NULL, @OutComeMsg);   /* test 3 */
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_Gas(32, 30, 150, NULL, @OutComeMsg);   /* test 4 */
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_Gas(10, 90, 490, 15, @OutComeMsg);     /* test 5 */
SELECT @OutComeMsg;

CALL PROJECT_Proc_Add_Gas(10, 90, 490, 30, @OutComeMsg);     /* should add correctly */
SELECT @OutComeMsg;


