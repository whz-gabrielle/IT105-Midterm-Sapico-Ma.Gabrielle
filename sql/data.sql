-- =========================
-- AUTHORS (10 records)
-- =========================
INSERT INTO Authors (author_name) VALUES
('J.K. Rowling'),
('George Orwell'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Stephen King'),
('Mark Twain'),
('Jane Austen'),
('Ernest Hemingway'),
('F. Scott Fitzgerald'),
('Charles Dickens');

-- =========================
-- BOOKS (10 records)
-- =========================
INSERT INTO Books (title, isbn, published_year, category, copies_available) VALUES
('Harry Potter and the Sorcerer''s Stone', '1111111111', 1997, 'Fantasy', 5),
('1984', '2222222222', 1949, 'Dystopian', 4),
('The Hobbit', '3333333333', 1937, 'Fantasy', 3),
('Murder on the Orient Express', '4444444444', 1934, 'Mystery', 2),
('The Shining', '5555555555', 1977, 'Horror', 6),
('Adventures of Huckleberry Finn', '6666666666', 1884, 'Adventure', 3),
('Pride and Prejudice', '7777777777', 1813, 'Romance', 4),
('The Old Man and the Sea', '8888888888', 1952, 'Fiction', 2),
('The Great Gatsby', '9999999999', 1925, 'Classic', 5),
('Oliver Twist', '1010101010', 1838, 'Classic', 3);

-- =========================
-- BORROWING (10 records)
-- =========================
INSERT INTO Borrowing (member_id, borrow_date, due_date, return_date) VALUES
(1, '2026-03-01', '2026-03-10', '2026-03-09'),
(2, '2026-03-02', '2026-03-11', NULL),
(3, '2026-03-03', '2026-03-12', '2026-03-12'),
(4, '2026-03-04', '2026-03-13', NULL),
(5, '2026-03-05', '2026-03-14', '2026-03-13'),
(6, '2026-03-06', '2026-03-15', NULL),
(7, '2026-03-07', '2026-03-16', '2026-03-15'),
(8, '2026-03-08', '2026-03-17', NULL),
(9, '2026-03-09', '2026-03-18', '2026-03-17'),
(10, '2026-03-10', '2026-03-19', NULL);

-- =========================
-- BORROW_DETAILS (10 records)
-- =========================
INSERT INTO Borrow_Details (borrow_id, book_id, quantity)
SELECT borrow_id, book_id, 1
FROM Borrowing, Books
LIMIT 10;
