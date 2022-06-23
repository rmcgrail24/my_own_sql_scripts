-- Use self-join to detect duplicate rows.
-- The most effective way to detect duplicate rows
-- is to join the table against itself as shown below. 

SELECT a.book_unique_id, a.page_seq_nbr, a.image_key 
  FROM page_image a 
 WHERE a.rowid > SELECT MIN(b.rowid) 
                 FROM page_image b 
                WHERE b.key1 = a.key1 
                  AND b.key2 = a.key2 
                  AND b.key3 = a.key3); 
