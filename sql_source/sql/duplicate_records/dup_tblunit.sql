SELECT a.*
  FROM tblunit a 
 WHERE a.rowid > (SELECT MIN(b.rowid) 
                 FROM tblunit b 
                WHERE b.propertyseq = a.propertyseq 
                  AND b.unit = a.unit 
                  AND b.unittypeseq = a.unittypeseq
                  AND b.maxoccupant = a.maxoccupant);

SELECT a.*
  FROM tblunit a
 WHERE a.rowid > ANY (SELECT b.rowid
                        FROM tblunit b
                       WHERE b.propertyseq = a.propertyseq 
                         AND b.unit = a.unit 
                         AND b.unittypeseq = a.unittypeseq
                         AND b.maxoccupant = a.maxoccupant);

SELECT a.*
  FROM tblunit a
 WHERE a.rowid > ANY (SELECT b.rowid
                        FROM tblunit b
                       WHERE  b.propertyseq = a.propertyseq
                         AND (b.unit = a.unit OR (b.unit IS NULL AND a.unit IS NULL))
                         AND (b.unittypeseq = a.unittypeseq OR (b.unittypeseq IS NULL AND a.unittypeseq IS NULL))
                         AND (b.maxoccupant = a.maxoccupant OR (b.maxoccupant IS NULL AND a.maxoccupant IS NULL)));

SELECT * 
  FROM (
    SELECT b.*, 
           count(*) OVER (PARTITION BY propertyseq, unit, unittypeseq, maxoccupant) ct
      FROM tblunit b
   )
 WHERE ct > 1;

SELECT a.*
  FROM tblunit a
 WHERE A.rowid IN (SELECT rid
                     FROM (SELECT rowid rid, 
                                  RANK() OVER (PARTITION BY propertyseq, unit, unittypeseq, maxoccupant
                                                   ORDER BY propertyseq, unit, unittypeseq, maxoccupant) rn
                             FROM tblunit)
                    WHERE rn > 1);

