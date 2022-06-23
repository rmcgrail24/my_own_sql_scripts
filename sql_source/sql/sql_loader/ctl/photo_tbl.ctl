LOAD DATA
   INFILE '/home/russ/data/Pictures/pictures.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/Photos.bad'
   INTO TABLE photo_tbl
      APPEND
      (line SEQUENCE (1),
       photo_name CHAR ENCLOSED BY '"',
--       photo_file LOBFILE(photo_name) RAW TERMINATED BY EOF
       photo_file CONSTANT "McGrail"
      )
