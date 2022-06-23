$ORACLE_HOME/bin/sqlplus <<!
conn / as sysdba
@generate_cold_backup.sql
shutdown immediate
!
cold_backup.sh
$ORACLE_HOME/bin/sqlplus <<!
conn / as sysdba
startup

!

