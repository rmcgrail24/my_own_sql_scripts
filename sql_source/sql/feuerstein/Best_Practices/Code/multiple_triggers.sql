/*-- multiple_trigger.drh */
DROP TABLE multiple_triggers;

CREATE TABLE multiple_triggers
(id NUMBER);

CREATE OR REPLACE TRIGGER increment_by_one
BEFORE INSERT ON multiple_triggers
FOR EACH ROW
BEGIN
  :new.id := :new.id + 1;
END;
/

CREATE OR REPLACE TRIGGER increment_by_two
BEFORE INSERT ON multiple_triggers
FOR EACH ROW
BEGIN
  IF :new.id > 1 THEN
    :new.id := :new.id + 2;
  END IF;
END;
/

INSERT INTO multiple_triggers
VALUES(1);

SELECT *
  FROM multiple_triggers;

