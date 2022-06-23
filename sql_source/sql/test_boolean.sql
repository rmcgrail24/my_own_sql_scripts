/* Formatted on 12/23/2013 3:34:09 PM (QP5 v5.215.12089.38647) */
DECLARE
   v_record_found   CHAR (1);
   retval           BOOLEAN;

   CURSOR document_types_cur
   IS
      SELECT 1
        FROM document_types dctp
       WHERE dctp.record_category = 'C' AND dctp.doc_type_code = 'CP' AND ROWNUM = 1;
BEGIN
   OPEN document_types_cur;

   FETCH document_types_cur INTO v_record_found;

   retval := document_types_cur%FOUND;

   CLOSE document_types_cur;

   IF NOT retval
   THEN
      DBMS_OUTPUT.put_line ('Record not found!');
   ELSE
      DBMS_OUTPUT.put_line ('Record found!');
   END IF;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
END;

SELECT dt1.id,
       dt2.id,
       dt1.record_category,
       dt2.record_category,
       dt1.doc_type_code,
       dt2.doc_type_code
  FROM    document_types dt1
       JOIN
          document_types dt2
       ON (dt1.record_category = dt2.record_category AND dt1.doc_type_code = dt2.doc_type_code)
 WHERE dt1.id != dt2.id;
 