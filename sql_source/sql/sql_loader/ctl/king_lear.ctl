LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/KingLear.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/KingLear.bad'
   INTO TABLE king_lear
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
