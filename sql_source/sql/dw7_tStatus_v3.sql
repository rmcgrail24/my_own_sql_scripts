/*****************************************************************************
Purpose: Return Table status information (size, rows, columns, mbytes, etc)
Columns:
  snapshot: Snapshot date
  dbname:   Database name
  schema:	Schema name
  tid:		Table id
  tname:	Table name
  tcol: 	Number of columns in a table
  trows: 	Number of rows in a table
  mbytes:	Size of the table in Megabytes
********************************************************************************/
with cr AS
    (SELECT c.table_name, c.tcols, r.trows
        FROM (SELECT table_name, COUNT(*) AS tcols FROM dba_tab_cols GROUP BY table_name) c
        JOIN (SELECT table_name, num_rows AS trows FROM dba_tables) r
        ON c.table_name = r.table_name)

SELECT * FROM (
    SELECT
	to_char(sn.begin_interval_time,'yy/mm/dd hh24:mm') AS snapshot
    , 'LDW' AS dbname , alt.owner AS schema  --,object_name, object_type, 
	, alt.tid , alt.table_name , alt.tcols , alt.trows
	--, ROUND(bytes)/1024/1024 AS meg    --, tablespace_name, extents, initial_extent
    , ROUND(Sum(alt.bytes/1024/1024) OVER (PARTITION BY alt.table_name)) AS mbytes
    FROM dba_hist_snapshot sn
    JOIN     (
        -- Tables
        SELECT stat.snap_id
			, s.owner		--, segment_name AS object_name
            , 'TABLE' AS object_type		, obj.object_id AS tid
            , s.segment_name AS table_name
            , cr.tcols		, cr.trows	      , s.bytes		  --, s.tablespace_name, s.extents, s.initial_extent
        FROM dba_segments s, dba_objects obj, cr, dba_hist_seg_stat stat
        WHERE  s.segment_name = obj.object_name
            AND cr.table_name = obj.object_name
			AND obj.object_id = stat.obj#
            AND s.segment_type IN ('TABLE', 'TABLE PARTITION', 'TABLE SUBPARTITION')
            AND obj.owner = 'HR'
        
        UNION ALL
        -- Indexes
        SELECT stat.snap_id
			, i.owner		--, i.index_name AS object_name
            , 'INDEX' AS object_type		, obj.object_id AS tid
            , i.table_name
            , cr.tcols		, cr.trows		, s.bytes        --s.tablespace_name, s.extents, s.initial_extent
        FROM   dba_indexes i, dba_segments s, dba_objects obj, cr, dba_hist_seg_stat stat
        WHERE  s.segment_name = obj.object_name
            AND i.index_name = obj.object_name
            AND cr.table_name = obj.object_name
			AND obj.object_id = stat.obj#
            AND s.owner = 'HR'
            AND s.owner = i.owner
            AND s.segment_type IN ('INDEX', 'INDEX PARTITION', 'INDEX SUBPARTITION')
        -- LOB Segments
        UNION ALL
        SELECT stat.snap_id
			, l.owner		--, l.column_name AS object_name
            , 'LOB_COLUMN' AS object_type		, obj.object_id AS tid
            , l.table_name
            , cr.tcols		, cr.trows		, s.bytes        --s.tablespace_name, s.extents, s.initial_extent
        FROM   dba_lobs l, dba_segments s, dba_objects obj, cr, dba_hist_seg_stat stat
        WHERE  s.segment_name = obj.object_name
            AND l.segment_name = obj.object_name
            AND cr.table_name = obj.object_name
			AND obj.object_id = stat.obj#
            AND s.owner = 'HR'
            AND s.owner = l.owner
            AND s.segment_type = 'LOBSEGMENT'
        -- LOB Indexes
        UNION ALL
        SELECT stat.snap_id 
			, l.owner		--, l.column_name AS object_name
            , 'LOB_INDEX' AS object_type		, obj.object_id AS tid
            ,l.table_name
            , cr.tcols		, cr.trows		, s.bytes        --s.tablespace_name, s.extents, s.initial_extent
        FROM   dba_lobs l, dba_segments s, dba_objects obj, cr, dba_hist_seg_stat stat
        WHERE  s.segment_name = obj.object_name
            AND l.index_name = obj.object_name	
            AND cr.table_name = obj.object_name	
			AND obj.object_id = stat.obj#			
            AND s.owner = 'HR'
            AND s.owner = l.owner
            AND s.segment_type = 'LOBINDEX'
   )alt 
    ON sn.snap_id = alt.snap_id
    INNER JOIN all_objects obj
    ON alt.table_name = obj.object_name
    --WHERE obj.owner = UPPER('&owner')
)
WHERE ROWNUM >=5  
    --AND total_table_meg > 10 /* to ignore small tables with size less then 10G*/
ORDER BY mbytes DESC
;