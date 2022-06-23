column dest_name format a60 hea 'Destination Name'
column destination format a60 hea 'Destination'

ttitle center '***** V$ARCHIVE_DEST View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT dest_id,
       dest_name,
       destination,
       status
  FROM v$archive_dest;

clear columns
ttitle off

