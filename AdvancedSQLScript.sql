
-- A select that selects data where an attribute is either null or not null
SELECT lastName, firstName, email, birthday
FROM PROJECT_Contact
WHERE birthday IS NOT NULL;


-- A select that includes an AVG
SELECT siteName, AVG(runTime)
FROM PROJECT_DiveSites AS site RIGHT JOIN PROJECT_DiveLog AS log
ON site.siteID = log.siteID
GROUP BY siteName;


-- A select that includes a COUNT
SELECT con.lastName, con.firstName, COUNT(ltd.diveID)

  FROM PROJECT_Contact      AS con,
       PROJECT_Diver        AS dvr,
       PROJECT_Log_to_Diver AS ltd

 WHERE con.contactID = dvr.contactID
   AND dvr.diverID = ltd.diverID

GROUP BY con.lastName;


-- A select that includes a MAX
SELECT siteName, lastName, firstName, MAX(log.maxDepth)

  FROM PROJECT_DiveSites    AS site, 
       PROJECT_Contact      AS con , 
       PROJECT_Diver        AS dvr , 
       PROJECT_DiveLog      AS log , 
       PROJECT_Log_to_Diver AS ltd

 WHERE site.siteID   = log.siteID
   AND con.contactID = dvr.contactID
   AND dvr.diverID   = ltd.diverID
   AND log.diveID    = ltd.diveID

GROUP BY lastName;

-- A select that includes a MIN
SELECT siteName, MIN(teamExpenses)

FROM PROJECT_DiveSites AS site,
     PROJECT_DiveLog   AS log

WHERE site.siteID = log.siteID

GROUP BY siteName;

-- A select that includes a SUM
SELECT SUM(teamExpenses)

FROM PROJECT_DiveLog

WHERE diveDate BETWEEN '2019-01-01' AND '2019-02-01';

-- A select that includes an aggregate function and an ORDER BY
SELECT siteName, AVG(teamExpenses)

  FROM PROJECT_DiveSites AS site,
       PROJECT_DiveLog   AS log

 WHERE site.siteID = log.siteID

GROUP BY siteName
ORDER BY teamExpenses;

-- A select that uses any aggregate function and a HAVING
SELECT siteName, permitID, SUM(teamExpenses)

  FROM PROJECT_DiveSites AS site,
       PROJECT_DiveLog   AS log

 WHERE site.siteID = log.siteID

GROUP BY siteName
HAVING permitID IS NOT NULL;

-- A select with a subquery that includes an IN
SELECT siteName, gps, county

FROM PROJECT_DiveSites

WHERE county IN ('Wakulla', 'Leon', 'Jackson');

-- A select with another query nested in it
SELECT lastName, firstName, title

  FROM PROJECT_Contact AS con,
       PROJECT_Diver AS dvr,
       PROJECT_Diver_to_Cert AS dtc

 WHERE con.contactID = dvr.contactID
   AND dvr.diverID = dtc.diverID
   AND dtc.diverID IN

       (
         SELECT dtc.diverID
         FROM PROJECT_Diver_to_Cert AS dtc
         WHERE certDate BETWEEN '1900-01-01' AND '1999-12-31'
       );
       



