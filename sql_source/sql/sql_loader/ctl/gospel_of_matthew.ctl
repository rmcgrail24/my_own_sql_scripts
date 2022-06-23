LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/GospelOfMatthew.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/GospelOfMatthew.bad'
   INTO TABLE gospel_of_matthew
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
