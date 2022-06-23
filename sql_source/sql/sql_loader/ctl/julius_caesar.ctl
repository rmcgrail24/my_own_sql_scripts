LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/JuliusCaesar.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/JuliusCaesar.bad'
   INTO TABLE julius_caesar
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
