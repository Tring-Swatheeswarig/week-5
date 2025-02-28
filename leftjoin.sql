-- LEFT JOIN (Show all books and their issued status, even if not issued)

SELECT b.title, b.author, ib.issue_date, u.name AS issued_to
FROM Books b
LEFT JOIN IssuedBooks ib ON b.isbn = ib.isbn
LEFT JOIN Users u ON ib.user_id = u.user_id;
