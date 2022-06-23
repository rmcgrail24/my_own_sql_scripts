/* Formatted by PL/Formatter v3.1.2.1 on 2001/01/27 13:11 */

CREATE OR REPLACE PACKAGE demo_pkg
IS
   --
   -- Purpose: Demonstration package for call stack and dump logging
   --
   -- Methods: PROC1()
   --          PROC2()
   --          instantiate_error_context()
   --
   -- MODIFICATION HISTORY
   -- Person      Date      Comments
   -- ---------   --------  -------------------------------------------
   -- DKK         01/02/01  creation

   PROCEDURE proc1;

   PROCEDURE proc2;

   PROCEDURE instantiate_error_context;
END;
/
CREATE OR REPLACE PACKAGE error_pkg
IS
   --
   -- Purpose: Package to handle errors raised during execution of other DB packages
   --
   -- Methods: set_module_name()
   --          remove_module_name()
   --
   -- MODIFICATION HISTORY
   -- Person      Date      Comments
   -- ---------   --------  -------------------------------------------
   -- DKK         02/01/01  creation

   -- Add the module name to the call stack, so that we know where
   -- any errors occurred.
   PROCEDURE set_module_name (
      module_name_in   IN   VARCHAR2
   );

   -- Add the module name to the call stack, so that we know where
   -- any errors occurred.
   PROCEDURE set_err_msg (
      msg_id_in   IN   VARCHAR2
   );

   -- As modules finish correctly the module name is dropped from
   -- the stack. When the last module completes correctly the stack is
   -- discarded.
   PROCEDURE remove_module_name;

   -- Called when we want to raise a specific error from the message table
   PROCEDURE raise_error (
      comments_in   IN   VARCHAR2 DEFAULT NULL
   );

   -- Called by obj_% packages to add context to error logs
   PROCEDURE add_context (
      context_domain_in   VARCHAR2 DEFAULT NULL,
      context_item_in     VARCHAR2,
      context_value_in    VARCHAR2
   );
END;                                                              -- error_pkg
/

CREATE OR REPLACE PACKAGE BODY demo_pkg
IS
   --
   -- Purpose: Demonstration package for call stack and dump logging
   --
   -- Methods: PROC1()
   --          PROC2()
   --          instantiate_error_context()
   --
   -- MODIFICATION HISTORY
   -- Person      Date      Comments
   -- ---------   --------  -------------------------------------------
   -- DKK         01/02/01  creation

   -- The following variables represent the attributes of the client object
   -- They are only modified and examined by the GAS routines of the package.
   -- The appropriate variables must be loaded before other DB packages are called
   -- that operate on the client object.

   TYPE application_rectype IS RECORD (
   
      field_1                       VARCHAR2 (12)
               := NULL,
      field_2                       INTEGER  := NULL,
      field_3                       INTEGER  := NULL);

   application application_rectype;

   --------------------------------------------------------------------
   -- The following are the GAS routines for all of the attributes associate with
   -- the application object
   --------------------------------------------------------------------

   PROCEDURE proc1
   IS
   BEGIN
      --announce entry into this module
      error_pkg.set_module_name ('demo_pkg.proc1');
      -- do your processing here.
      application.field_1 := 'test string';
      proc2;
      error_pkg.remove_module_name;
   EXCEPTION
      WHEN OTHERS
      THEN
         error_pkg.set_err_msg ('DAT023');
         error_pkg.raise_error ('Failed Operation');
   END;

   PROCEDURE proc2
   IS
   BEGIN
      --announce entry into this module
      error_pkg.set_module_name ('demo_pkg.proc2');
      -- do your processing here.
      application.field_2 := -37;
      -- force an error to occur here so we can see the resulting dump
      RAISE NO_DATA_FOUND;
      error_pkg.remove_module_name;
   EXCEPTION
      WHEN OTHERS
      THEN
         error_pkg.set_err_msg ('DAT027');
         error_pkg.raise_error ('Failed Operation');
   END;

   --------------------------------------------------------------------
   -- Add dump information to the trace record
   PROCEDURE instantiate_error_context
   IS
   BEGIN
      error_pkg.add_context ('DEMO_PKG', 'Field #1', application.field_1);
      error_pkg.add_context ('DEMO_PKG', 'Field #2', application.field_2);
      error_pkg.add_context ('DEMO_PKG', 'Field #3', application.field_3);
   END;
END;
/
CREATE OR REPLACE PACKAGE BODY error_pkg
IS
   --
   -- Purpose: Package to handle errors raised during execution of other DB packages
   --
   --
   -- MODIFICATION HISTORY
   -- Person      Date      Comments
   -- ---------   --------  -------------------------------------------
   -- DKK         01/02/01  creation

   ------------------------------------------------------------
   -- Private type definitions
   ------------------------------------------------------------
   --  SUBTYPE message_type is messages.msgtext%TYPE;

   TYPE stack IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE error_context_rectype IS RECORD (
   
      context_domain                VARCHAR2 (30)
               := NULL,
      context_item                  VARCHAR2 (25)
               := NULL,
      context_value                 VARCHAR2 (250)
               := NULL);

   TYPE error_context_type IS TABLE OF error_context_rectype
      INDEX BY BINARY_INTEGER;

   ------------------------------------------------------------
   -- Private Package variables
   ------------------------------------------------------------
   error_context error_context_type;
   empty_error_context error_context_type;          -- to clear error_context
   max_context_id PLS_INTEGER := 0;             -- index for error_context
   call_stack stack;                              -- Stack of calling modules
   empty_stack stack;                                  -- to clear call_stack
   top_of_stack PLS_INTEGER := 0;                      -- call_stack index
   stack_is_empty BOOLEAN := TRUE;
   call_stack_text VARCHAR2 (2000) := NULL;
   -- text representation of call_stack, created on first call to raise_error
   err_msg_id VARCHAR2(100) := NULL;
   err_msg_type VARCHAR2 (3) := NULL; -- DAT or APP, passed in by set_err_msg
   err_comments VARCHAR2 (2000) := NULL;          -- passed in by raise_error

   -----------------------------------------------------------
   --                  Private Interface                    --
   -----------------------------------------------------------

   --------------------------------------------------------------------------
   -- Clear the stack and release the memory associated with it.
   -- This is done when either
   -- a) the whole sequence of calls completed successfully
   -- b) an exception has been raised, and we have already dumped out the call stack
   PROCEDURE clear_stack
   IS
   BEGIN
      call_stack := empty_stack;
      top_of_stack := 0;
      stack_is_empty := TRUE;
   END;

   --------------------------------------------------------------
   -- Return TRUE if one of the elements in the call stack was from the package
   -- identified by the value passed in.  Since the call stack elements are formatted
   -- like <package_name>.<module> we will then look for any element containing
   -- <element_in>.
   -- This only works because of standards that were set early on in development (e.g.
   -- absolutely NO code outside of packages etc)
   FUNCTION package_exists (
      element_in   IN   VARCHAR2
   )
      RETURN BOOLEAN
   IS
      retval BOOLEAN := FALSE;
   BEGIN
      FOR cur_index IN NVL (call_stack.FIRST, 0) .. NVL (call_stack.LAST, 0)
      LOOP
         BEGIN
            IF INSTR (UPPER (call_stack (cur_index)), UPPER (element_in || '.'
                                                      )
               ) > 0
            THEN
               retval := TRUE;
            END IF;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               NULL;
         END;
      END LOOP;

      RETURN retval;
   END;

   --------------------------------------------------------------
   -- Clears error context (error_context)
   PROCEDURE clear_context
   IS
   BEGIN
      error_context := empty_error_context;
      max_context_id := 0;
   END;

   --------------------------------------------------------------
   -- Called by raise_error to create a log file describing the error
   PROCEDURE log_error
   IS
      ldomain VARCHAR2 (25);
   BEGIN
      clear_context;
      add_context ('ERROR', 'Error Log Time', TO_CHAR (SYSDATE, 'HH24:MI:SS'));
      add_context ('ERROR', 'Call Stack', call_stack_text);
      add_context ('ERROR', 'Comments', err_comments);
      add_context ('ERROR', 'CFRS Error No', err_msg_id);
      add_context ('ERROR', 'Oracle Error', SQLERRM);

      -- call the same method on each package that I am interested in
      -- This was originally written using Oracle 7.3.4, and I'm sure that with
      -- NDS it could be enhanced to dynamically build a PLSQL block for each of these...
      -- The following if - end if section should be repeated for each package of interest.
      -- We only had about three that were critical in troubleshooting, so it wasn't worth the
      -- effort to make it any more elaborate at the time.
      IF package_exists ('DEMO_PKG')
      THEN
         demo_pkg.instantiate_error_context;
      END IF;

      FOR iloop IN 0 .. max_context_id - 1
      LOOP
         IF ldomain != error_context (iloop).context_domain
         THEN
            pl (RPAD ('----------' || error_context (iloop).context_domain,
                   40, '-'
                )
            );
         END IF;

         pl (RPAD (error_context (iloop).context_item || ': ', 26) ||
                error_context (iloop).context_value
         );
         ldomain := error_context (iloop).context_domain;
      END LOOP;
   EXCEPTION
      WHEN OTHERS
      THEN
         pl ('Problem in error_pkg.log_error: ' || SQLERRM);
   END;

   -----------------------------------------------------------
   --                  Public  Interface                    --
   -----------------------------------------------------------

   --------------------------------------------------------------
   -- Called by obj_% packages to add context to error logs
   PROCEDURE add_context (
      context_domain_in   VARCHAR2 DEFAULT NULL,
      context_item_in     VARCHAR2,
      context_value_in    VARCHAR2
   )
   IS
   BEGIN
      error_context (max_context_id).context_domain :=
                                            SUBSTR (context_domain_in, 1, 30);
      error_context (max_context_id).context_item :=
                                              SUBSTR (context_item_in, 1, 25);
      error_context (max_context_id).context_value :=
                               SUBSTR (NVL (context_value_in, 'NULL'), 1, 250);
      max_context_id := max_context_id + 1;
   END;

   --------------------------------------------------------------
   -- Set the active error message for retrieval by the calling procedure
   PROCEDURE set_err_msg (
      msg_id_in   IN   VARCHAR2
   )
   IS
   BEGIN
      -- validate the format of the message number
      IF    UPPER (SUBSTR (msg_id_in, 1, 3)) NOT IN ('DAT', 'APP')
         OR TO_NUMBER (SUBSTR (msg_id_in, 4, 3)) NOT BETWEEN 0 AND 499
      THEN
         -- invalid message type
         raise_application_error (-20000, 'Invalid message number');
      END IF;

      -- only set the message id if it isn't already defined
      IF err_msg_id IS NULL
      THEN
         err_msg_type := UPPER (SUBSTR (msg_id_in, 1, 3));
         err_msg_id := msg_id_in;
      END IF;
   END;

   --------------------------------------------------------------
   -- Add the module name to the call stack, so that we know where
   -- any errors occurred.
   PROCEDURE set_module_name (
      module_name_in   IN   VARCHAR2
   )
   IS
   BEGIN
      pl ('Adding ' || module_name_in || ' to stack');

      IF stack_is_empty
      THEN
         call_stack (1) := SUBSTR (module_name_in, 1, 100);
         top_of_stack := 1;
         stack_is_empty := FALSE;
      ELSE
         top_of_stack := top_of_stack + 1;
         call_stack (top_of_stack) := SUBSTR (module_name_in, 1, 100);
      END IF;

      -- clear out the msg nbr from any previous unsuccessful run
      err_msg_id := NULL;
      err_comments := NULL;
      call_stack_text := NULL;
   EXCEPTION
      -- something really bad must happen to get here, probably some PL/SQL table error
      WHEN OTHERS
      THEN
         pl ('********************* STACK FAULT ************************');
         NULL;
   END;

   ----------------------------------------------------------------
   -- As modules finish correctly the module name is dropped from
   -- the list. When the last module completes correctly the array is
   -- discarded.
   PROCEDURE remove_module_name
   IS
      empty_stack EXCEPTION;
   BEGIN
      -- check if the user is trying to pop off an element that doesn't exist
      IF stack_is_empty
      THEN
         RAISE empty_stack;
      END IF;

      pl ('removing ' || call_stack (top_of_stack) || ' from stack....');
      -- clear the contents of the stack element
      call_stack (top_of_stack) := NULL;
      -- move the stack pointer down to the next element
      top_of_stack := top_of_stack - 1;
      -- if there are no more elements in the stack, set our boolean variable
      stack_is_empty := (top_of_stack = 0);

      -- if the stack doesn't contain any elements, release the memory associated with it.
      IF stack_is_empty
      THEN
         clear_stack;
      END IF;
   EXCEPTION
      WHEN empty_stack
      THEN
         pl ('********************* STACK FAULT ************************');
         NULL;
      WHEN OTHERS
      THEN
         set_err_msg ('DAT005');
         raise_error;
   END;

   --------------------------------------------------------------
   -- Return a text representation of the call stack
   FUNCTION get_call_stack
      RETURN VARCHAR2
   IS
      l_call_stack_text VARCHAR2 (2000);
   BEGIN
      IF stack_is_empty
      THEN
         l_call_stack_text := l_call_stack_text || '<EMPTY>';
      ELSE
         FOR stack_index IN 1 .. top_of_stack
         LOOP
            IF stack_index = 1
            THEN
               l_call_stack_text :=
                                l_call_stack_text || call_stack (stack_index);
            ELSE
               l_call_stack_text :=
                       l_call_stack_text || ' --> ' || call_stack (stack_index
                                                       );
            END IF;
         END LOOP;
      END IF;

      RETURN (l_call_stack_text);
   EXCEPTION
      WHEN OTHERS
      THEN
         set_err_msg ('DAT073');
         raise_error;
   END;

   --------------------------------------------------------------
   -- Called when we determine that the required parameters aren't available
   -- The module names in the error stack are displayed with the module which has
   -- the error indicated
   PROCEDURE raise_error (
      comments_in   IN   VARCHAR2 DEFAULT NULL
   )
   IS
      msg_nbr INTEGER;
   BEGIN
      msg_nbr := TO_NUMBER (SUBSTR (err_msg_id, 4, 3));

      IF call_stack_text IS NULL
      THEN
         call_stack_text := SUBSTR (get_call_stack, 1, 2000);
         err_comments := comments_in;
         log_error;
      END IF;

      clear_stack;

      IF err_msg_type = 'DAT'
      THEN
         raise_application_error ( (-20000 - msg_nbr),
            call_stack_text || ' failed to Complete!!!' || err_comments
         );
      ELSIF err_msg_type = 'APP'
      THEN
         raise_application_error ( (-20500 - msg_nbr),
            call_stack_text || ' failed to Complete!!!' || err_comments
         );
      END IF;
   END;
END;
/


-- End of DDL Script for Package Body BOOK.ERROR_PKG


-- End of DDL Script for Package Body BOOK.error_pkg



