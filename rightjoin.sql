-- RIGHT JOIN (Show all users and books they have issued, if any)
SELECT u.name, b.title, ib.issue_date
FROM Users u
RIGHT JOIN IssuedBooks ib ON u.user_id = ib.user_id
RIGHT JOIN Books b ON ib.isbn = b.isbn;

