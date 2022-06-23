LOAD DATA
   INFILE '/home/russ/data/text_files/names.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/names.bad'
   INTO TABLE names
      TRUNCATE
   FIELDS TERMINATED BY ','
   TRAILING NULLCOLS
      (first, last)
