ttitle center '***** V$NLS_VALID_VALUES *****'

SELECT *
  FROM v$nls_valid_values
ORDER BY parameter, value;

ttitle off

