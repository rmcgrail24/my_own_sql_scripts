#$ORACLE_HOME/bin/imp username AS SYSDBA   /* Use in invoke Import as SYSDBA. */
#$ORACLE_HOME/bin/imp help=y
$ORACLE_HOME/bin/imp username PARFILE=params.dat
