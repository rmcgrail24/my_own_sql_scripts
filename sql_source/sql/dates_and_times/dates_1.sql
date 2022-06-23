select 'Today is ' || to_char(sysdate, 'fmDay", the" ddspth "day of" Month"," Year"."') || chr(10)
       || 'There are ' || to_char(to_number(to_char(add_months(last_day(sysdate), 12 - to_number(to_char(sysdate, 'mm'))), 'J')) -
                              to_number(to_char(sysdate, 'J'))) || ' days left in this year.' || chr(10)
       || to_char(sysdate - 1, 'fm"Yesterday was" Day", the" ddspth "day of" Month"."') || chr(10)
       || to_char(sysdate + 1, 'fm"Tomorrow will be" Day", the" ddspth "day of" Month"."') "Fancy Date"
from dual
/
