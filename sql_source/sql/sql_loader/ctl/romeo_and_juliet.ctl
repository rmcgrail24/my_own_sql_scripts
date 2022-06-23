LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/RomeoAndJuliet.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/RomeoAndJuliet.bad'
   INTO TABLE romeo_and_juliet
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
