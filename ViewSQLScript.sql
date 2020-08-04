--Three statements that drop the three views

DROP VIEW PROJECT_ViewDiveLog;
DROP VIEW PROJECT_ViewDiverActivity;
DROP VIEW PROJECT_ViewDivePlanning;

--A statement that creates a view that combines at least 2 tables (referred to later as View1) 

CREATE VIEW PROJECT_ViewDiveLog AS

SELECT log.diveID, siteName, diveDate, description

FROM PROJECT_DiveLog      AS log,
     PROJECT_DiveSites    AS site

WHERE site.siteID   = log.siteID;


--A statement that creates a view that combines at least 3 tables (referred to later as View2)    

CREATE VIEW PROJECT_ViewDiverActivity AS

SELECT log.diveID, siteName, dvr.diverID, lastName, firstName, diveDate, runTime, log.maxDepth

FROM PROJECT_DiveLog      AS log,
     PROJECT_DiveSites    AS site,
     PROJECT_Contact      AS con,
     PROJECT_Diver        AS dvr,
     PROJECT_Log_to_Diver AS ltd

WHERE site.siteID   = log.siteID
  AND con.contactID = dvr.contactID
  AND dvr.diverID   = ltd.diverID
  AND log.diveID    = ltd.diveID;


--A statement that creates a view that uses an aggregate function (referred to later as View3)

CREATE VIEW PROJECT_ViewDivePlanning AS

SELECT siteName, AVG(log.maxDepth) AS Depth, AVG(runTime) AS Time, AVG(teamExpenses) AS Cost

FROM PROJECT_DiveSites AS site,
     PROJECT_DiveLog   AS log
     
WHERE site.siteID = log.siteID

GROUP BY siteName;

--A select that utilizes View1

SELECT siteName, diveDate, description
FROM PROJECT_ViewDiveLog
WHERE description LIKE '%survey%';

--A select that utilizes View2 and an aggregate function

SELECT lastName, firstName, COUNT(diveID), SUM(runTime)
FROM PROJECT_ViewDiverActivity
GROUP BY diverID;

--A select that utilizes View3

SELECT siteName, Depth
FROM PROJECT_ViewDivePlanning
WHERE Depth < 100;





