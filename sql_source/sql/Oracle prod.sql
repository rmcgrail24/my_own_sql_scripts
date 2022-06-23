SELECT ID
  FROM cust_contact
MINUS
SELECT ID
  FROM cust;

SELECT ID
FROM cust_contact
where id not in (select id from cust);