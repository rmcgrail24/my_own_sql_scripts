LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/Hamlet.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/Hamlet.bad'
   Append INTO TABLE hamlet
--      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
