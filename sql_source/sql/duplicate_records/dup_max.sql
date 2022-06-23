-- Use rowid with the GROUP BY clause 

DELETE FROM employees a
 WHERE a.rowid NOT IN (SELECT MAX(b.rowid)
                         FROM employees b
                       GROUP BY b.empno);

------------------------------------------
-- Use self-join to detect duplicate rows.
-- The most effective way to detect duplicate rows
-- is to join the table against itself as shown below. 

SELECT a.book_unique_id, a.page_seq_nbr, a.image_key 
  FROM page_image a 
 WHERE a.rowid > SELECT MIN(b.rowid) 
                 FROM page_image b 
                WHERE b.key1 = a.key1 
                  AND b.key2 = a.key2 
                  AND b.key3 = a.key3); 

---------------------------------------------------
-- Here we see an example of using SQL to delete
-- duplicate table rows using a SQL subquery
-- to identify duplicate rows,
-- manually specifying the join columns.
-- Please note that you must specify all of the columns
-- that make the row a duplicate in the SQL WHERE clause.

DELETE FROM table_name a
 WHERE a.rowid > ANY (SELECT b.rowid
                        FROM table_name b
                       WHERE b.col1 = a.col1
                         AND b.col2 = a.col2);

--------------------------------------------
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

------------------------------------------

DELETE FROM employees a
 WHERE a.rowid IN (SELECT b.rid
                     FROM (SELECT rowid rid, 
                                  RANK() OVER (PARTITION BY employee_id ORDER BY employee_id) rn
                             FROM employees) b
                    WHERE b.rn > 1);

-------------------------------------------

We have a table with duplicate records for columnA, and we want to write a SQL query to make columnA the primary key. For this we need a delete query to delete the duplicate records so that columnA will have only unique values.
To remove duplicate rows of data, use the following statement:

DELETE FROM my_table 
 WHERE rowid NOT IN (SELECT MAX(ROWID)
                       FROM my_table
                     GROUP BY colA,colB,colC );

In the GROUP BY clause, enumerate all of your columns in your table, or the columns you think should be the primary key columns. The subquery will get the max rowid of these groupings. The DELETE will remove all rows that do not have these rowid values.

-------------------------------------------------

So you're looking for two (or more) rows that are copies of each other. For example, the two rows below hold identical information:

TITLE    UK_RELEASE_DATE   LENGTH_IN_MINUTES BBFC_RATING 
-------  ----------------- ----------------- -----------
Frozen   06-DEC-2013 00:00        102          PG        
Frozen   06-DEC-2013 00:00        102          PG

So when looking for copies here, you want to use:

title, uk_release_date

If you have two (or more) rows with the same title and release date you could have multiple rows which are exact copies. This is bad, but at least the information is consistent. You can happily remove one of these from the table.

select f.*, 
       count(*) over (
         partition by title, uk_release_date
       ) ct
from   films f;

select * 
from   (
  select f.*, 
         count(*) over (
           partition by title, uk_release_date
         ) ct
  from   films f
)
where  ct > 1;

delete films
where  film_id not in (
  select min(film_id)
  from   films
  group  by title, uk_release_date
)

delete films
where  rowid not in (
  select min(rowid)
  from   films
  group  by title, uk_release_date
)




