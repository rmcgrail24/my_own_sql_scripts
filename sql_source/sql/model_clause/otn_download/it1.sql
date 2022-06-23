SELECT b, account
FROM ledger
  MODEL  IGNORE NAV 
    DIMENSION BY (account)   
    MEASURES (balance b) 
    RULES ITERATE (100)  (
      b['Net'] =  b['Salary'] - b['Interest'] - b['Tax'],
      b['Tax'] = (b['Salary'] - b['Interest']) * 0.38 + 
                  b['Capital_gains'] *0.28,
      b['Interest'] = b['Net'] * 0.30
  )
/
