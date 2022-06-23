LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/WarAndPeace.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/WarAndPeace.bad'
   INTO TABLE war_and_peace
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
