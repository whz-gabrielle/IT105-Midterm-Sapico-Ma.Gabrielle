SELECT book_id, title, copies_available
FROM Books
WHERE copies_available > 0;

INSERT INTO Members (first_name, last_name, email, phone)
VALUES ('Daniel', 'Reyes', 'daniel@example.com', '09271234567');

INSERT INTO Books (title, isbn, published_year, category, copies_available)
VALUES ('The Silent Patient', '1212121212', 2019, 'Thriller', 4);

INSERT INTO Authors (author_name)
VALUES ('Alex Michaelides');

-- Link book to author
INSERT INTO Book_Authors (book_id, author_id)
VALUES (LAST_INSERT_ID(), LAST_INSERT_ID());  -- assumes last inserted book/author

UPDATE Books
SET copies_available = copies_available - 1
WHERE book_id = 3;