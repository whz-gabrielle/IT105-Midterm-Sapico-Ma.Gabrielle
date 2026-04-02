-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- =========================
-- 1. MEMBERS TABLE
-- =========================
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    membership_date DATE DEFAULT CURRENT_DATE
);

-- =========================
-- 2. AUTHORS TABLE
-- =========================
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- =========================
-- 3. BOOKS TABLE
-- =========================
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    published_year YEAR,
    category VARCHAR(50),
    copies_available INT DEFAULT 1
);

-- =========================
-- 4. BORROWING TABLE
-- =========================
CREATE TABLE Borrowing (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    borrow_date DATE DEFAULT CURRENT_DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- =========================
-- 5. BORROW_DETAILS TABLE
-- =========================
CREATE TABLE Borrow_Details (
    borrow_id INT,
    book_id INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (borrow_id, book_id),
    FOREIGN KEY (borrow_id) REFERENCES Borrowing(borrow_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
