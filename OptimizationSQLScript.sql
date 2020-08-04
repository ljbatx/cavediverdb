--A statement that drops an index that you will create later in the script

DROP INDEX Indx_diverCredentials_certDate ON PROJECT_Diver_to_Cert(certDate) using BTree;

--A select statement that runs a sql statement 

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

--Use Explain on the A select statement above to see how this query was executed 

EXPLAIN SELECT lastName, firstName, title

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
       ) \G

--A statement that creates an index that optimizes the select SQL statement

CREATE INDEX Indx_diverCredentials_certDate ON PROJECT_Diver_to_Cert(certDate) using BTree;

--A select statement that runs the same sql statement

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

--Use Explain on the A select statement above to see how this query was executed

EXPLAIN 
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
       ) \G



