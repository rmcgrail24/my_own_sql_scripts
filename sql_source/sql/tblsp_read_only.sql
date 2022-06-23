prompt 
prompt The following SELECT identifies the transaction entry for the ALTER TABLESPACE...READ ONLY statement and displays its session address (saddr):

SELECT sql_text,
       saddr
  FROM v$sqlarea JOIN v$session ON (v$sqlarea.address=v$session.sql_address)
 WHERE sql_text LIKE 'alter tablespace';
 
prompt The start SCN of each active transaction is stored in the V$TRANSACTION view. Displaying this view sorted by ascending start SCN
prompt lists the transactions in execution order. From the preceding example, we already know the session address of the transaction entry
prompt for the read-only statement, and we can now locate it in the V$TRANSACTION view. All transactions with smaller start SCN,
prompt which indicates an earlier execution, can potentially hold up the quiesce and subsequent read-only state of the tablespace.

SELECT ses_addr,
       start_scnb
  FROM v$transaction
ORDER BY start_scnb;

prompt We can now find the owners of the blocking transactions:

SELECT ses_addr,
       username,
       machine
  FROM v$session JOIN v$transaction ON (saddr=ses_addr)
ORDER BY ses_addr;

