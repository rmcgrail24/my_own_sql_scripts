SELECT begin_time,
       end_time,
       group_id,
       elapsedpercall,
       cpupercall,
       dbtimepercall,
       callspersec,
       dbtimepersec,
       flags
  FROM v$servicemetric;

clear columns

