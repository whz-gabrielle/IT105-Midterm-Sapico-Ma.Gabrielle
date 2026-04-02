What changed?
The database performs a full table scan, meaning it checks every row in the books table to find a match. And after creating an index, CREATE INDEX idx_books_title ON Books(title);, the database no longer scans the entire table. Instead, it uses the index, which acts like a sorted lookup structure. to quickly locate the matching record. 

Why Faster?
It is faster because it reduces the number of rows scanned, it also allows the database to jump directly to the needed data. It uses a structure similar to a search tree. In simplest explanation without index, it is reading the whole book page by page; but with index it goes directly to the page using the index. 

Why Indexing is important?
First of all, it speeds up SELECT queries, and especially useful for WHERE conditions, JOIN operations, and lastly ORDER BY. Second, it is efficient for data retrieval as it quickly finds records even in large datasets and reduces execution time significantly. 
Lastly, it enhances user experience for faster queries or faster system response. 
