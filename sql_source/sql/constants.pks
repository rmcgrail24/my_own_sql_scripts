/* Formatted on 1/16/2014 4:03:43 PM (QP5 v5.215.12089.38647) */
CREATE OR REPLACE PACKAGE constants
AS
   /******************************************************************************
      NAME:       constants
      PURPOSE:

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        12/16/2013      rmcgrail     1. Created this package.
   ******************************************************************************/
   SUBTYPE cmax_vc2 IS stg_image_error.lst_file_hint%TYPE;

   c_lst_file_hint_01    CONSTANT cmax_vc2 := 'see Record Category | ';
   c_lst_file_hint_02    CONSTANT cmax_vc2 := 'see Scanning Office | ';
   c_lst_file_hint_03    CONSTANT cmax_vc2 := 'see Doc Type | ';
   c_lst_file_hint_04    CONSTANT cmax_vc2 := 'see Area Office | ';
   c_lst_file_hint_05    CONSTANT cmax_vc2 := ' | ';
   c_lst_file_hint_06    CONSTANT cmax_vc2 := 'see Effective Date | ';
   c_lst_file_hint_07    CONSTANT cmax_vc2 := 'see Contract No | ';
   c_lst_file_hint_08    CONSTANT cmax_vc2 := 'see Contract No | ';
   c_lst_file_hint_08a   CONSTANT cmax_vc2 := 'see SSN and or Multi-ID - NO_DATA_FOUND | ';
   c_lst_file_hint_08b   CONSTANT cmax_vc2 := 'see SSN and or Multi-ID - TOO_MANY_ROWS | ';
   c_lst_file_hint_08c   CONSTANT cmax_vc2 := 'see SSN and or Multi-ID - OTHERS | ';
   c_lst_file_hint_09    CONSTANT cmax_vc2 := 'see Expiration Date | ';
   c_lst_file_hint_10    CONSTANT cmax_vc2 := 'see Effective Date, Expiration Date, Extension Date | ';
   c_lst_file_hint_11    CONSTANT cmax_vc2 := 'see Scanned Date | ';
   c_lst_file_hint_12    CONSTANT cmax_vc2 := 'see Indexed Date | ';
   c_lst_file_hint_13    CONSTANT cmax_vc2 := 'see Page Count | ';
   c_lst_file_hint_14    CONSTANT cmax_vc2 := 'see Correspondence Date | ';
   c_lst_file_hint_15    CONSTANT cmax_vc2 := 'see tif file | ';
   c_lst_file_hint_16    CONSTANT cmax_vc2 := 'see Receipt Date | ';
   c_lst_file_hint_17    CONSTANT cmax_vc2
      := 'see PRTC CASE_NUMBER INQUIRY_TYPE TYPE_OF_CLAIM_APPLIED | ' ;
   c_lst_file_hint_18    CONSTANT cmax_vc2 := 'unique_violation_constraint verbiage | ';
END constants;
/