column aggregation_type format a25
column primary_id format a25
column qualifier_id1 format a25
column qualifier_id2 format a25

SELECT aggregation_type,
       primary_id,
       qualifier_id1,
       qualifier_id2
  FROM dba_enabled_aggregations;

clear columns

