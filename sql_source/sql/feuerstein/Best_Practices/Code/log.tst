@@log.pkg

BEGIN
   log_pkg.putline (SQLCODE, SQLERRM);
   
   pl ('Before 8i rollback ' || tabcount (USER, 'logtab'));
   
   ROLLBACK;
   
   pl ('After 8i rollback ' || tabcount (USER, 'logtab'));
END;
/

@@log73.pkg

BEGIN
   log_pkg.putline (SQLCODE, SQLERRM);
   
   pl ('Before 7.3 rollback ' || tabcount (USER, 'logtab'));
   
   ROLLBACK;
   
   pl ('After 7.3 rollback ' || tabcount (USER, 'logtab'));
END;
/
