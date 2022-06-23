SELECT capability_name, possible, SUBSTR(related_text, 1, 8) rel_text,
       SUBSTR(msgtxt, 1, 60) msgtxt
  FROM mv_capabilities_table
ORDER BY seq;
