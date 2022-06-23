set linesize 156;
set pagesize 66;

column owner format a25;
column object_name format a25;

break on owner on object_type;

ttitle center '***** Oracle Supplied PL/SQL Packages and Types *****' -
       right 'Page: ' format 99 sql.pno skip -
       center 'DBA_OBJECTS_AE View' skip 2
 
SELECT DISTINCT owner,
       object_type,
       object_name,
       object_id,
       created "Created",
       last_ddl_time "Last DDL Time",
       TO_DATE(timestamp, 'YYYY-MM-DD HH24:MI:SS') "Timestamp",
       status
  FROM dba_objects_ae
 WHERE owner IN ('SYS', 'OUTLN', 'SYSTEM', 'CTXSYS', 'DBSNMP',
       'LOGSTDBY_ADMINISTRATOR', 'ORDSYS',
       'ORDPLUGINS', 'OEM_MONITOR', 'WKSYS', 'WKPROXY',
       'WK_TEST', 'WKUSER', 'MDSYS', 'LBACSYS', 'DMSYS',
       'WMSYS', 'OLAPDBA', 'OLAPSVR', 'OLAP_USER',
       'OLAPSYS', 'EXFSYS', 'SYSMAN', 'MDDATA',
       'SI_INFORMTN_SCHEMA', 'XDB', 'ODM')
   AND object_type IN ('PACKAGE', 'TYPE')
--   AND owner = 'PRACTICE'
ORDER BY owner, object_type, object_name;

clear breaks
clear columns
ttitle off

