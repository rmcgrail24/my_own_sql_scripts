-- Table to test various techniques for detecting duplicate record.

CREATE TABLE emp (empno INTEGER,
                  emp_name VARCHAR2(20),
                  salary NUMBER);

-- Insert some duplicates and some non-duplicates
/*
INSERT INTO emp VALUES (10, 'Bill', 2000);
INSERT INTO emp VALUES (11, 'Bill', 2000);
INSERT INTO emp VALUES (12, 'Mark', 3000);
INSERT INTO emp VALUES (12, 'Mark', 3000);
INSERT INTO emp VALUES (12, 'Mark', 3000);
INSERT INTO emp VALUES (13, 'Tom', 4000);
INSERT INTO emp VALUES (14, 'Tom', 5000);
INSERT INTO emp VALUES (15, 'Susan', 5000);
COMMIT;
*/
