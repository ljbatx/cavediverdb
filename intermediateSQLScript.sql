-- Select data from a single table

SELECT *
FROM PROJECT_DiveSites;

-- Select data from a single table limit columns

SELECT siteName, gps, county
FROM PROJECT_DiveSites;

-- Select data from a single table limit rows

SELECT *
FROM PROJECT_DiveSites
WHERE county = 'Jackson';

-- Select data from a single table limit both rows and columns

SELECT siteName, gps
FROM PROJECT_DiveSites
WHERE county = 'Wakulla';

-- Select data from a single table with a where using like

SELECT *
FROM PROJECT_DiveSites
WHERE hours LIKE '%24%%';

-- Select data from a single table with a where clauses using between

SELECT *
FROM PROJECT_DiveSites
WHERE maxDepth BETWEEN 120 AND 250;

-- Inner join two tables

SELECT *
FROM PROJECT_Contact AS c INNER JOIN PROJECT_Diver AS d
ON c.contactID = d.contactID;

-- Right join two tables

SELECT * 
FROM PROJECT_DiveSites AS s RIGHT JOIN PROJECT_Permits AS p
ON s.permitID = p.permitID;

-- Left join two tables

SELECT *
FROM PROJECT_DiveLog AS l LEFT JOIN PROJECT_DiveSites as s
ON l.siteID = s.siteID;

-- Full join two tables

SELECT *
FROM PROJECT_DiveLog AS l LEFT JOIN PROJECT_DiveSites as s
ON l.siteID = s.siteID
UNION
SELECT *
FROM PROJECT_DiveLog AS l RIGHT JOIN PROJECT_DiveSites as s
ON l.siteID = s.siteID;
