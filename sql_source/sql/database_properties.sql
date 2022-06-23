column property_name format a40 hea 'Property Name'
column property_value format a40 hea 'Property Value'
column description format a60 hea 'Description'

ttitle center '***** DATABASE_PROPERTIES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT property_name,
       property_value
--       description
  FROM database_properties
ORDER BY property_name;

ttitle off
