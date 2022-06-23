#$ORACLE_HOME/bin/exp username AS SYSDBA   /* Use in invoke Export as SYSDBA. */
#$ORACLE_HOME/bin/exp help=y > parameters.txt
$ORACLE_HOME/bin/exp username PARFILE=params.dat
