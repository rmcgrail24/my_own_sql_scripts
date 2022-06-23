select *
  from tblclientfee
 where clientseq = 16034
order by clientfeeseq, clientseq, propertyseq, unitseq, transdate, transperiod,
         feetypeseq, fee, batchnbrseq, processnbrseq, invoicenbrseq, vouchernbrseq;
         
select count(*) from tblclientfee;