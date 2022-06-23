CREATE TABLE "EXT_NAMES" 
(
  "FIRST" VARCHAR2(10),
  "LAST" VARCHAR2(10)
)
ORGANIZATION external 
(
  TYPE oracle_loader
  DEFAULT DIRECTORY system_dmp
  ACCESS PARAMETERS 
  (
    RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
    BADFILE '/home/russ/sql/sql_loader/bad':'names_ext.bad'
    LOGFILE '/home/russ/sql/sql_loader/log/names_ext.log_xt'
    READSIZE 1048576
    FIELDS TERMINATED BY "," LDRTRIM 
    MISSING FIELD VALUES ARE NULL 
    REJECT ROWS WITH ALL NULL FIELDS 
    (
      "FIRST" CHAR(255)
        TERMINATED BY ",",
      "LAST" CHAR(255)
        TERMINATED BY ","
    )
  )
  location 
  (
    'names.txt'
  )
)REJECT LIMIT UNLIMITED;

