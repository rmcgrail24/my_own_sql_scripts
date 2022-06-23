SELECT b.*
  FROM tblclientfee b
 WHERE b.rowid > (SELECT MIN(a.rowid)
                    FROM tblclientfee a
                   WHERE a.clientseq = b.clientseq
                     AND a.propertyseq = b.propertyseq
                     AND a.unitseq = b.unitseq
                     AND a.transdate = b.transdate
                     AND a.transperiod = b.transperiod
                     AND a.feetypeseq = b.feetypeseq
                     AND a.fee = b.fee
                     AND a.batchnbrseq = b.batchnbrseq
                     AND a.processnbrseq = b.processnbrseq
                     AND a.invoicenbrseq = b.invoicenbrseq
                     AND a.vouchernbrseq = b.vouchernbrseq
                     AND a.notes = b.notes);


SELECT b.*
  FROM tblclientfee b
 WHERE b.rowid > (SELECT MIN(a.rowid)
                    FROM tblclientfee a
                   WHERE a.clientseq = b.clientseq
                     AND a.propertyseq = b.propertyseq
                     AND a.unitseq = b.unitseq
                     AND (a.transdate = b.transdate OR (a.transdate IS NULL AND b.transdate IS NULL))
                     AND (a.transperiod = b.transperiod OR (a.transperiod IS NULL AND b.transperiod IS NULL))
                     AND (a.feetypeseq = b.feetypeseq OR (a.feetypeseq IS NULL AND b.feetypeseq IS NULL))
                     AND (a.fee = b.fee OR (a.fee IS NULL AND b.fee IS NULL))
                     AND (a.batchnbrseq = b.batchnbrseq OR (a.batchnbrseq IS NULL AND b.batchnbrseq IS NULL))
                     AND (a.processnbrseq = b.processnbrseq OR (a.processnbrseq IS NULL AND b.processnbrseq IS NULL))
                     AND (a.invoicenbrseq = b.invoicenbrseq OR (a.invoicenbrseq IS NULL AND b.invoicenbrseq IS NULL))
                     AND (a.vouchernbrseq = b.vouchernbrseq OR (a.vouchernbrseq IS NULL AND b.vouchernbrseq IS NULL))
                     AND (a.notes = b.notes OR (a.notes IS NULL AND b.notes IS NULL)));


SELECT b.*
  FROM tblclientfee b
 WHERE b.rowid > ANY (SELECT a.rowid
                        FROM tblclientfee a
                       WHERE a.clientseq = b.clientseq 
                         AND a.propertyseq = b.propertyseq 
                         AND a.unitseq = b.unitseq
                         AND a.transdate = b.transdate
                         AND a.transperiod = b.transperiod
                         AND a.feetypeseq = b.feetypeseq
                         AND a.fee = b.fee
                         AND a.batchnbrseq = b.batchnbrseq
                         AND a.processnbrseq = b.processnbrseq
                         AND a.invoicenbrseq = b.invoicenbrseq
                         AND a.vouchernbrseq = b.vouchernbrseq
                         AND a.notes = b.notes);


SELECT b.*
  FROM tblclientfee b
 WHERE b.rowid > ANY (SELECT a.rowid
                        FROM tblclientfee a
                       WHERE (a.clientseq = b.clientseq)
                         AND (a.propertyseq = b.propertyseq)
                         AND (a.unitseq = b.unitseq)
                         AND (a.transdate = b.transdate OR (a.transdate IS NULL AND b.transdate IS NULL))
                         AND (a.transperiod = b.transperiod OR (a.transperiod IS NULL AND b.transperiod IS NULL))
                         AND (a.feetypeseq = b.feetypeseq OR (a.feetypeseq IS NULL AND b.feetypeseq IS NULL))
                         AND (a.fee = b.fee OR (a.fee IS NULL AND b.fee IS NULL))
                         AND (a.batchnbrseq = b.batchnbrseq OR (a.batchnbrseq IS NULL AND b.batchnbrseq IS NULL))
                         AND (a.processnbrseq = b.processnbrseq OR (a.processnbrseq IS NULL AND b.processnbrseq IS NULL))
                         AND (a.invoicenbrseq = b.invoicenbrseq OR (a.invoicenbrseq IS NULL AND b.invoicenbrseq IS NULL))
                         AND (a.vouchernbrseq = b.vouchernbrseq OR (a.vouchernbrseq IS NULL AND b.vouchernbrseq IS NULL))
                         AND (a.notes = b.notes OR (a.notes IS NULL AND b.notes IS NULL)));


SELECT b.*
  FROM (
    SELECT a.*,
           count(*) OVER (PARTITION BY clientseq, propertyseq, unitseq,
                                       transdate, transperiod, feetypeseq,
                                       fee, batchnbrseq, processnbrseq,
                                       invoicenbrseq, vouchernbrseq, notes
--                              ORDER BY clientseq, propertyseq, unitseq,
--                                       transdate, transperiod, feetypeseq,
--                                       fee, batchnbrseq, processnbrseq,
--                                       invoicenbrseq, vouchernbrseq, notes
                         ) ct
      FROM tblclientfee a
   ) b
 WHERE b.ct > 1;


-- The following won't work at all!!!
SELECT b.*
  FROM tblclientfee b
 WHERE b.rowid IN (SELECT a.rid
                     FROM (SELECT rowid rid, 
                                  RANK() OVER (PARTITION BY clientseq, propertyseq, unitseq,
                                                            transdate, transperiod, feetypeseq,
                                                            fee, batchnbrseq, processnbrseq,
                                                            invoicenbrseq, vouchernbrseq, notes
                                                   ORDER BY clientseq, propertyseq, unitseq,
                                                            transdate, transperiod, feetypeseq,
                                                            fee, batchnbrseq, processnbrseq,
                                                            invoicenbrseq, vouchernbrseq, notes
                                              ) rn
                             FROM tblclientfee
                          ) a
                    WHERE a.rn > 1);


select b.* from tblclientfee b
where (b.clientseq, b.propertyseq, b.unitseq,
       b.transdate, b.transperiod, b.feetypeseq,
       b.fee, b.batchnbrseq, b.processnbrseq,
--       b.invoicenbrseq, b.vouchernbrseq, b.notes) in  -- NULL value for notes affects comparison
       b.invoicenbrseq, b.vouchernbrseq, nvl(b.notes,'??????')) in
(
select a.clientseq, a.propertyseq, a.unitseq
       , a.transdate
       , a.transperiod
       , a.feetypeseq
       , a.fee
       , a.batchnbrseq
       , a.processnbrseq
       , a.invoicenbrseq
       , a.vouchernbrseq
--       , a.notes       
       , nvl(a.notes, '??????') "Notes"
--       , count(*)
  from tblclientfee a
-- where clientseq = 749
-- where clientfeeseq in (37267, 37268)
group by a.clientseq, a.propertyseq, a.unitseq
       , a.transdate
       , a.transperiod
       , a.feetypeseq
       , a.fee
       , a.batchnbrseq
       , a.processnbrseq
       , a.invoicenbrseq
       , a.vouchernbrseq
       , a.notes
having count(*) > 1
)
;

