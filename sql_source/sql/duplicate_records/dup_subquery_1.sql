-- Here we see an example of using SQL to delete duplicate table rows using an SQL subquery to identify duplicate rows,
-- manually specifying the join columns:

DELETE FROM table_name A
 WHERE a.rowid > ANY (SELECT B.rowid
                        FROM table_name B
                       WHERE A.col1 = B.col1
                         AND A.col2 = B.col2);

