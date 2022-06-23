column occupant_name format a30
column schema_name format a30
column space_usage_kbytes format 999,999

SELECT occupant_name,
       occupant_desc,
       schema_name,
       space_usage_kbytes
  FROM v$sysaux_occupants
ORDER BY occupant_name;

clear columns

