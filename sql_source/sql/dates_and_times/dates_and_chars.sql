/* Formatted on 3/27/2014 8:40:29 AM (QP5 v5.215.12089.38647) */
SELECT DBTIMEZONE, SESSIONTIMEZONE FROM DUAL;

SELECT TO_DATE ('2009', 'YYYY') FROM DUAL;

SELECT TO_CHAR (TO_DATE ('01-01-2009', 'MM-DD-YYYY'), 'J') FROM DUAL;

SELECT SYSDATE, TO_CHAR (SYSDATE, 'J') FROM DUAL;

SELECT SYSDATE, TO_CHAR (SYSDATE, 'DL') FROM DUAL;

SELECT SYSDATE, TO_CHAR (SYSDATE, 'DS') FROM DUAL;

SELECT contracts.*, ROWID FROM contracts;

SELECT CHR (67) || CHR (65) || CHR (84) "Dog" FROM DUAL;

SELECT CHR (195) || CHR (193) || CHR (227) "Dog" FROM DUAL;

SELECT CHR (8364) || CHR (67) || CHR (65) || CHR (84) "Dog" FROM DUAL;

-------

--SELECT CHR (0x21) || CHR (0x23) || CHR (0x24) "Dog" FROM DUAL;

SELECT CHR (21) || CHR (23) || CHR (24) "Dog" FROM DUAL;

SELECT CHR (33) || CHR (35) || CHR (36) "Dog" FROM DUAL;

-------

SELECT CHR (41378) FROM DUAL;

SELECT CHR (196 USING NCHAR_CS) FROM DUAL;

SELECT CONVERT ('Ä Ê Í Õ Ø A B C D E ', 'US7ASCII', 'WE8ISO8859P1') FROM DUAL;

SELECT DUMP ('Oracle', 1016) FROM DUAL;

  SELECT *
    FROM v$nls_val id_values
   WHERE parameter = 'CHARACTERSET'
ORDER BY VALUE;

SELECT TO_DATE ('31-AUG-2004', 'DD-MON-YYYY') + TO_YMINTERVAL ('0-1') FROM DUAL;

SELECT TO_DATE ('29-FEB-2004', 'DD-MON-YYYY') + TO_YMINTERVAL ('1-0') FROM DUAL;

SELECT TO_DATE ('29-FEB-2004', 'DD-MON-YYYY') + TO_YMINTERVAL ('4-0') FROM DUAL;

---------------------
DROP TABLE t;

CREATE TABLE t
(
   c1   CHAR,
   c2   CHAR (6),
   c3   VARCHAR2 (6),
   c4   NUMBER (6),
   c5   NUMBER (6),
   c6   NUMBER,
   c7   NUMBER (38),
   c8   FLOAT (5)
);

INSERT INTO t
     VALUES ('7',
             '7',
             '7',
             7,
             777777,
             777777,
             11122233344455566677788899900011122233,
             123.45);

SELECT c1,
       DUMP (c1, 10) "c1",
       c2,
       DUMP (c2, 10) "c2",
       c3,
       DUMP (c3, 10) "c3",
       c4,
       DUMP (c4, 10) "c4",
       c5,
       DUMP (c5, 10) "c5",
       c6,
       DUMP (c6, 10) "c6",
       -- c7,
       --DUMP (c7, 10) "c7",
       c8,
       DUMP (c8, 10) "c8"
  FROM t;

DELETE FROM t;

----------------

DECLARE
   p1   PLS_INTEGER := 2147483647;
   p2   PLS_INTEGER := 1;
   n    NUMBER;
BEGIN
   n := p1 + p2;
END;

DECLARE
   p1   PLS_INTEGER := 2147483647;
   p2   INTEGER := 1;
   n    NUMBER;
BEGIN
   n := p1 + p2;
END;

----------------
--Example 3-6 Violating Constraint of SIMPLE_INTEGER Subtype

DECLARE
   a   SIMPLE_INTEGER := 1;
   b   PLS_INTEGER := NULL;
BEGIN
   a := b;
END;