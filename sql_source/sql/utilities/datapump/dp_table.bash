#$ORACLE_HOME/bin/expdp hr/hr TABLES=war_and_peace DIRECTORY=export_dumps DUMPFILE=literature%U.dmp LOGFILE=literature_export.log JOB_NAME=lit_export
$ORACLE_HOME/bin/expdp hr/hr TABLES=war_and_peace DIRECTORY=export_dumps DUMPFILE=lit%U.dmp PARALLEL=2 LOGFILE=literature_export.log JOB_NAME=lit_export
