CREATE TABLE a (id INTEGER);
INSERT INTO a VALUES (1);
INSERT INTO a VALUES (1);
INSERT INTO a VALUES (1);
INSERT INTO a VALUES (2);
INSERT INTO a VALUES (2);
INSERT INTO a VALUES (5);
INSERT INTO a VALUES (6);

CREATE TABLE b (id INTEGER);
INSERT INTO b VALUES (1);
INSERT INTO b VALUES (1);
INSERT INTO b VALUES (2);
INSERT INTO b VALUES (2);
INSERT INTO b VALUES (2);
INSERT INTO b VALUES (6);

SELECT A.ID
  FROM A JOIN b ON (A.ID = b.ID);

SELECT A.ID
  FROM A FULL OUTER JOIN b ON (A.ID = b.ID);
  
SELECT 1 AS ID , 'aaa' AS VALUE FROM dual
union all
SELECT 1 AS ID , 'bbb' AS VALUE FROM dual;

select 1 as id , 'aaa' as value from dual union all
select 1 as id , 'bbb' as value from dual union all
select 1 as id , 'ccc' as value from dual union all
select 2 as id , 'ddd' as value from dual union all
select 2 as id , 'eee' as value from dual union all
SELECT 5 AS ID , 'fff' AS VALUE FROM dual UNION ALL
SELECT 6 AS ID , 'ggg' AS VALUE FROM dual;

with table_a as
( select 1 as id , 'aaa' as value from dual union all
select 1 as id , 'bbb' as value from dual union all
select 1 as id , 'ccc' as value from dual union all
select 2 as id , 'ddd' as value from dual union all
select 2 as id , 'eee' as value from dual union all
select 5 as id , 'fff' as value from dual union all
select 6 as id , 'ggg' as value from dual ) ,
table_b as
( select 1 as id , 'AAA' as value from dual union all
select 1 as id , 'BBB' as value from dual union all
select 2 as id , 'CCC' as value from dual union all
select 2 as id , 'DDD' as value from dual union all
select 2 as id , 'EEE' as value from dual union all
select 6 as id , 'FFF' as value from dual )
select * from table_a
INNER JOIN table_b
ON table_a.ID = table_b.ID;

with table_a as
( select 1 as id , 'aaa' as value from dual union all
select 1 as id , 'bbb' as value from dual union all
select 1 as id , 'ccc' as value from dual union all
select 2 as id , 'ddd' as value from dual union all
select 2 as id , 'eee' as value from dual union all
select 5 as id , 'fff' as value from dual union all
select 6 as id , 'ggg' as value from dual ) ,
table_b as
( select 1 as id , 'AAA' as value from dual union all
select 1 as id , 'BBB' as value from dual union all
select 2 as id , 'CCC' as value from dual union all
select 2 as id , 'DDD' as value from dual union all
select 2 as id , 'EEE' as value from dual union all
select 6 as id , 'FFF' as value from dual )
select * from table_a
LEFT /*right / full*/ OUTER JOIN table_b
on table_a.id = table_b.id;