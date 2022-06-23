rem Show dispatcher and shared server processes

SELECT d.name,
       s.name
  FROM v$dispatcher d
  JOIN v$circuit c ON d.paddr=c.dispatcher
  JOIN v$shared_server s ON s.paddr=c.server;

