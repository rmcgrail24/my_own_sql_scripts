LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/GreatExpectations.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/GreatExpectations.bad'
   INTO TABLE great_expectations
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
