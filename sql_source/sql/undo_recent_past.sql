prompt
prompt This script will create a small report of how much undo has been generated
prompt in the recent past.
prompt
SELECT begin_time,
       end_time,
       (undoblks * (SELECT value FROM v$parameter WHERE name='db_block_size')) undo_bytes
  FROM v$undostat;

