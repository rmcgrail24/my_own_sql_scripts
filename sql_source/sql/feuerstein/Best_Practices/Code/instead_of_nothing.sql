/*
  || Handle situations when INSTEAD OF triggers actually
  || do not perform any DML
*/

DROP VIEW ballot_view;
DROP TABLE ballot_table;

CREATE TABLE ballot_table
(county     VARCHAR2(30),
 democrat   VARCHAR2(1),
 republican VARCHAR2(1));

CREATE VIEW ballot_view
AS SELECT *
     FROM ballot_table;

CREATE OR REPLACE TRIGGER instead_of_insert
INSTEAD OF INSERT ON ballot_view
BEGIN
  IF :NEW.county = 'PALM BEACH' THEN
    INSERT INTO ballot_table
    VALUES('PALM BEACH','N','Y');
  END IF;
END;
/

INSERT INTO ballot_view
VALUES('PALM BEACH','Y','N');
INSERT INTO ballot_view
VALUES('OVERSEAS','Y','N');

SELECT *
  FROM ballot_view;

CREATE OR REPLACE TRIGGER instead_of_insert
INSTEAD OF INSERT ON ballot_view
BEGIN
  IF :NEW.county = 'PALM BEACH' THEN
    INSERT INTO ballot_table
    VALUES('PALM BEACH','N','Y');
  ELSE
    RAISE_APPLICATION_ERROR(-20000,'Please wait for the manual recount');
  END IF;
END;
/

INSERT INTO ballot_view
VALUES('OVERSEAS','Y','N');
