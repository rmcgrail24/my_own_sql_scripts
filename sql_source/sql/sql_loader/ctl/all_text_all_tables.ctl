LOAD DATA
   INFILE '/home/russ/data/text_files/Gutenberg/GospelOfJohn.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/GospelOfJohn.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/GospelOfMatthew.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/GospelOfMatthew.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/GreatExpectations.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/GreatExpectations.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/Hamlet.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/Hamlet.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/JuliusCaesar.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/JuliusCaesar.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/KingLear.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/KingLear.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/Macbeth.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/Macbeth.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/PickwickPapers.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/PickwickPapers.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/RomeoAndJuliet.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/RomeoAndJuliet.bad'
   INFILE '/home/russ/data/text_files/Gutenberg/WarAndPeace.txt'
      BADFILE '/home/russ/sql/sql_loader/bad/WarAndPeace.bad'
   INTO TABLE gospel_of_john
      TRUNCATE
      (line SEQUENCE (1),
       text CHAR(100)
      )
   INTO TABLE gospel_of_matthew
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE great_expectations
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE hamlet
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE julius_caesar
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE king_lear
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
    INTO TABLE macbeth
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE pickwick_papers
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE romeo_and_juliet
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
   INTO TABLE war_and_peace
      TRUNCATE
      (line SEQUENCE (1),
       text POSITION(1) CHAR(100)
      )
