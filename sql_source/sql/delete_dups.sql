DELETE FROM photo_tbl a
 WHERE a.rowid >
           ANY (SELECT b.rowid
                  FROM photo_tbl b
                 WHERE (a.line = b.line OR (a.line IS NULL AND b.line IS NULL))
                   AND (a.photo_name = b.photo_name OR (a.photo_name IS NULL AND b.photo_name IS NULL))
               )
;

