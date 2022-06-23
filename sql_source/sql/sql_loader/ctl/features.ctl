LOAD DATA
   INFILE '/home/russ/c/Matthew/coll_obj.dat'
      BADFILE '/home/russ/sql/sql_loader/bad/features.bad'
   INTO TABLE features
      TRUNCATE
      (feature_id SEQUENCE (COUNT,1),
       feature COLUMN OBJECT
          (
          feature_name POSITION (1:27) CHAR,
          feature_elevation POSITION (29:32) INTEGER EXTERNAL,
          feature_type POSITION (34:99) CHAR
          ),
      modification_date SYSDATE 
      )
