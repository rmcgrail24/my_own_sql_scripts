import java.io.File;

public class JFile {
/*----------------------------------------------------------------
||                  PL/Vision Professional 
||----------------------------------------------------------------
||    File: JFile.java
||  Author: Steven Feuerstein
||
|| This is a part of the PL/Vision Professional Code library.
|| Copyright (C) 1996-1999 RevealNet, Inc.
|| All rights reserved.
||
|| For more information, call RevealNet at 1-800-REVEAL4
|| or check out our Web page: www.revealnet.com
||
******************************************************************/

/***************** Modification History **************************
|| Date     By     Description
|| 2/26/99  SEF    Created
|| 8/2000   SEF    Incorporate into PL/Vision
******************************************************************/

   public static String separator (String fileName) {
      File myFile = new File (fileName);
      return myFile.separator;
      }

   public static int canRead (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.canRead();
      if (retval) return 1; else return 0;
      }

   public static int canWrite (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.canWrite();
      if (retval) return 1; else return 0;
      }

   public static int exists (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.exists();
      if (retval) return 1; else return 0;
      }

   public static int isDirectory (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.isDirectory();
      if (retval) return 1; else return 0;
      }

   public static int isFile (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.isFile();
      if (retval) return 1; else return 0;
      }

   public static long length (String fileName) {
      File myFile = new File (fileName);
      return myFile.length();
      }

   public static String parentDir (String fileName) {
      File myFile = new File (fileName);
      return myFile.getParent();
      }

   public static String pathName (String fileName) {
      File myFile = new File (fileName);
      return myFile.getPath();
      }

   public static long lastModified (String fileName) {
      File myFile = new File (fileName);
      return myFile.lastModified();
      }

   public static int delete (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.delete();
      if (retval) return 1; else return 0;
      }

   public static int mkdir (String fileName) {
      File myFile = new File (fileName);
      boolean retval = myFile.mkdir();
      if (retval) return 1; else return 0;
      }

   public static int rename (
         String oldFile, String newFile) {
      File myFile = new File (oldFile);
      File myFile2 = new File (newFile);
      boolean retval = myFile.renameTo(myFile2);
      if (retval) return 1; else return 0;
      }
      
   /*
   public static oracle.sql.ARRAY dirContents (String dir) 
      throws SQLException, ClassNotFoundException {
      
      File myDir = new File (dir);
      String[] filesList = myDir.list();
      
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = new OracleDriver().defaultConnection();
      
      ArrayDescriptor arrayDesc = 
         ArrayDescriptor.createDescriptor ("directory_t", con);
      oracle.sql.ARRAY filesArray = new oracle.sql.ARRAY (arrayDesc, con, filesList);
      
      return filesArray;
      }
   */

   public static String dirContents (String dir) {
      File myDir = new File (dir);
      String[] filesList = myDir.list();
      String contents = new String();
      for (int i = 0; i < filesList.length; i++) 
         contents = contents + "|" + filesList[i];
      return contents;
      }
   
   public static void main (String[] args) {
      String contents = dirContents (args[0]);
      System.out.println (contents);
      /*
      try {
         oracle.sql.ARRAY filesArray = dirContents (args[0]);
         String[] files = (String[]) filesArray.getArray ();
         for (int i = 0; i <= files.length; i++) 
            System.out.println (files[i]);
         }
      catch ( SQLException e ) {
         System.out.println (e.getMessage());}
      catch ( ClassNotFoundException e ) {
         System.out.println ("ClassNotFoundException");}
      */
   } 
           
}