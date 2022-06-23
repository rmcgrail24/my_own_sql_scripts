LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/Macbeth.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/Macbeth.bad'
   INTO TABLE macbeth
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
