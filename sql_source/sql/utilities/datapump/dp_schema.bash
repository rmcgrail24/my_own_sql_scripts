#$ORACLE_HOME/bin/expdp hr/hr TABLES=war_and_peace DIRECTORY=export_dumps DUMPFILE=literature%U.dmp LOGFILE=literature_export.log JOB_NAME=lit_export
$ORACLE_HOME/bin/expdp hr/hr SCHEMAS=hr DIRECTORY=export_dumps DUMPFILE=schemas%U.dmp LOGFILE=hr_export.log JOB_NAME=hr_export
