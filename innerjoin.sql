-- INNER JOIN (Show only issued books and details)

SELECT b.title, b.author, u.name, ib.issue_date
FROM IssuedBooks ib
INNER JOIN Books b ON ib.isbn = b.isbn
INNER JOIN Users u ON ib.user_id = u.user_id;
