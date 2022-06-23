select owner
, object_name
, subobject_name
, object_id
, data_object_id
, object_type
, created
, last_ddl_time
, timestamp
, status
, temporary
, generated
, secondary
, namespace
, edition_name
from all_objects
where rownum < 21
/
