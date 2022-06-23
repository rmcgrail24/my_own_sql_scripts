SELECT TO_CHAR(dt, 'hh:mi am'),
       TO_CHAR(dt, 'fmhh:mi am'),
       TO_CHAR(dt, 'fmhhfm:mi am')
  FROM (SELECT TO_DATE('09:01 am', 'hh:mi am') dt
          FROM dual);

SELECT ADD_MONTHS('24-JAN-09', 1) "New Date" FROM dual;

-- Strange but valid separators!  The second separator does not have to be the same as the first!
SELECT ADD_MONTHS('1\january/8', 1) "New Date" FROM dual;

-- Strange but valid separators!
SELECT MONTHS_BETWEEN('13*jan*8', '13/feb/2008') "Months Between" FROM dual;

-- Strange but valid separators!
SELECT ADD_MONTHS('01$jan/08', 1) "New Date" FROM dual;

-- jana is an invalid month
SELECT ADD_MONTHS('13!jana08', 1) FROM dual;

SELECT ADD_MONTHS('24-JAN-09 18:45', 1) FROM dual;
