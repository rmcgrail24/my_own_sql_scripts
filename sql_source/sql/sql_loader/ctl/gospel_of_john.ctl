LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/GospelOfJohn.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/GospelOfJohn.bad'
   INTO TABLE gospel_of_john
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
