/* 
   The first time this is run, especially after a fresh compile, 
   you should see the first access take more time, and then the
	second access less time (probably 0 hundredths of seconds, actually).

   If you the script a second time, both accesses with take "no" time.
*/
begin
   plvtmr.capture;
   p.l (sessinit.printer);
   p.l (sessinit.show_lov);
   plvtmr.show_elapsed;
   
   plvtmr.capture;
   p.l (sessinit.printer);
   p.l (sessinit.show_lov);
   plvtmr.show_elapsed;
end;
/
