-------------------------------------------------------------------------------
--
-- Script:	nice_shared_pool_flush.sql
-- Purpose:	to flush the shared pool without losing sequence numbers
--
-- Copyright:	(c) 1999 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@keep_cursors 5
@keep_sequences

alter system flush shared_pool
/

