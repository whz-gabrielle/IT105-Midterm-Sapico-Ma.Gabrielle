SELECT book_id, title, copies_available
FROM Books
WHERE copies_available > 0;

INSERT INTO Members (first_name, last_name, email, phone)
VALUES ('Daniel', 'Reyes', 'daniel@example.com', '09271234567');

INSERT INTO Books (title, isbn, published_year, category, copies_available)
VALUES ('The Silent Patient', '1212121212', 2019, 'Thriller', 4);

INSERT INTO Authors (author_name)
VALUES ('Alex Michaelides');

UPDATE Books
SET copies_available = copies_available - 1
WHERE book_id = 3;

UPDATE Members
SET phone = '09381234567'
WHERE member_id = 2;

DELETE FROM Books
WHERE book_id = 10;

SELECT m.first_name, m.last_name, b.title, br.borrow_date, br.due_date
FROM Members m
JOIN Borrowing br ON m.member_id = br.member_id
JOIN Borrow_Details bd ON br.borrow_id = bd.borrow_id
JOIN Books b ON bd.book_id = b.book_id
WHERE m.member_id = 1;

