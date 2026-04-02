UNF:
Data contains repeating groups (multiple books and authors in one record).

| BorrowID | MemberName | MemberEmail | BookTitles | Authors        | BorrowDate |  DueDate   |
| -------- | ---------- | ----------- | ---------- | -------------- | ---------- | ---------- |
|    1     | Juan Cruz  | juan@email  | HP, 1984   | Rowling, Orwell| 2026-03-01 | 2026-03-10 |


1NF:
The repeating groups are eliminated by ensuring that each field contains atomic values. 

| BorrowID | MemberName | MemberEmail | BookTitle | AuthorName | BorrowDate | DueDate    |
| -------- | ---------- | ----------- | --------- | ---------- | ---------- | ---------- |
| 1        | Juan Cruz  | juan@email  | HP        | Rowling    | 2026-03-01 | 2026-03-10 |
| 1        | Juan Cruz  | juan@email  | 1984      | Orwell     | 2026-03-01 | 2026-03-10 |


2NF:
Partial dependencies are removed by dividing the data into separate tables. 

Members table: 
| MemberID | MemberName | MemberEmail |
| -------- | ---------- | ----------- |
| 1        | Juan Cruz  | juan@email  |

Books table:
| BookID | BookTitle | AuthorName |
| ------ | --------- | ---------- |
| 1      | HP        | Rowling    |
| 2      | 1984      | Orwell     |

Borrowing table: 
| BorrowID | MemberID | BorrowDate | DueDate    |
| -------- | -------- | ---------- | ---------- |
| 1        | 1        | 2026-03-01 | 2026-03-10 |

Borrow details table:
| BorrowID | BookID |
| -------- | ------ |
| 1        | 1      |
| 1        | 2      |


3NF:
Transitive dependencies are eliminated by further separating data. 

| MemberID | MemberName | MemberEmail |
| -------- | ---------- | ----------- |
| AuthorID | AuthorName |
| -------- | ---------- |
| BookID | BookTitle |
| ------ | --------- |
| BookID | AuthorID |
| ------ | -------- |
| BorrowID | MemberID | BorrowDate | DueDate |
| -------- | -------- | ---------- | ------- |
| BorrowID | BookID |
| -------- | ------ |
