PROJECT TITLE:
Library Management Information System Database 

SYSTEM DESCRIPTION:
The Library Management Information System is a database-driven system designed to help libraries operate smoothly by keeping track of things like book classification, member registration, and borrowing transactions. The system maintains records as well as organizes information about books, authors, members, and borrowing activities, making it easy to access and manage.

This system does away with the need for manual record-keeping by giving you a structured database that makes sure your data is accurate, consistent, and safe. It helps with important library tasks like keeping track of which books are available, keeping track of borrowed items, and keeping track of the relationships between books and authors. The design follows normalization rules up to the Third Normal Form (3NF) to cut down on duplication and make things work better.

TABLES DESCRIPTION:
Members: Stores information about library users. 
member_id - Primary Key
first_name, last_name - Member's name
email, phone - Contact Details
membership_date - Registration date

Authors: Stores information about book authors.
author_id - Primary Key
author_name - Name of the Author

Books: Stores book details availble in the Library.
book_id - Primary Key
title - Book title
isbn - Unique Identifier
published_year, category - Book details
copies_available - Number of available copies

Borrowing: Stores borrowing transaction records.
borrow_id - Primary Key
member_id - Foreign Key
borrow_date, due_date, return_date - Transaction details

Borrow Details: Stores books included in each borrowing transaction.
borrow_id - Foreign Key
book_id - Foreign Key
quantity - Number of copies borrowed

FEATURES IMPLEMENTED:
- Book Management-> to add, update, and delete book records and track available copies.
- Member Management-> register and manage library members.
- Borrowing system-> record borrowing and returning of books, track due dates and returned items. 
- Relational database design-> implemented foreign keys to maintain relationships and managed many-to-many relationship.
- Query operations-> SELECT, INSERT, UPDATE, DELETE queries.
 -> JOIN queries for retreiving related data 
 -> Subqueries for advanced data retrieval
- Indexing-> implemented indexing to improve query performance.
- Normalization-> eliminated redundancy and improved data integrity and consistency.

REFLECTION:
While working on this mini Library Information System database, I gained a much clearer understanding of how relational databases are designed and put into practice. I realized how important normalization is for organizing data efficiently and cutting down on redundancy. Moving the data from UNF to 3NF really helped me see how to properly structure tables and set up their relationships.

I also picked up practical skills in writing SQL queries, like SELECT, INSERT, UPDATE, DELETE, JOIN, and subqueries. Plus, I learned how indexing can speed up database performance by making queries run faster, which is especially useful with large datasets.

One challenge I faced was managing foreign key constraints and making sure data was inserted in the right order. This experience helped me better understand referential integrity and how different tables connect with each other.

Overall, this project boosted my knowledge of database management systems and gave me hands-on experience designing a functional and efficient information system. It also sharpened my problem-solving skills and prepared me to tackle more advanced database projects down the road.

