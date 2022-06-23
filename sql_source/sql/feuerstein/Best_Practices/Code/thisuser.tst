@@tmr81.ot
@@thisuser.pkg
DECLARE
   v VARCHAR2(30);
   once_tmr tmr_t := tmr_t.make ('Packaged Function', &1);
   myonce_tmr tmr_t := tmr_t.make ('Packaged Constant', &1);
   every_tmr tmr_t := tmr_t.make ('USER Function', &1);
BEGIN
   once_tmr.go;
   FOR indx IN 1 .. &1
   LOOP
      v := thisuser.name;
   END LOOP;
   once_tmr.stop;

   myonce_tmr.go;
   FOR indx IN 1 .. &1
   LOOP
      v := thisuser.cname;
   END LOOP;
   myonce_tmr.stop;
   
   every_tmr.go;
   FOR indx IN 1 .. &1
   LOOP
      v := USER;
   END LOOP;
   every_tmr.stop;
END;
/

