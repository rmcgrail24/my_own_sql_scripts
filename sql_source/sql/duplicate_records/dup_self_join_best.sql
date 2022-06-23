-- Rob Arden states:  The tip on this page helped
-- with removing duplicate rows from Oracle tables.
-- I thought this might be useful so I'm passing it on.
-- I needed to add a null check because this fails
-- to remove dupe rows where the fields match on a null value.  

DELETE FROM table_name a
 WHERE a.rowid > ANY (SELECT b.rowid
                        FROM table_name b
                       WHERE (b.col1 = a.col1 OR (b.col1 IS NULL AND a.col1 IS NULL))
                         AND (b.col2 = a.col2 OR (b.col2 IS NULL AND a.col2 IS NULL)));
