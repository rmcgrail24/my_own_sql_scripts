LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/PickwickPapers.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/PickwickPapers.bad'
   INTO TABLE pickwick_papers
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
