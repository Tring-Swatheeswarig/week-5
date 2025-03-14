CREATE OR REPLACE FUNCTION issue_book(p_isbn TEXT, p_user_id TEXT)
RETURNS TEXT AS $$
DECLARE result TEXT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Users WHERE user_id = p_user_id) THEN
        RETURN 'User not found!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Books WHERE isbn = p_isbn) THEN
        RETURN 'Book not found!';
    END IF;

    IF EXISTS (SELECT 1 FROM Books WHERE isbn = p_isbn AND is_issued) THEN
        RETURN 'Book is already issued!';
    END IF;

    INSERT INTO IssuedBooks (isbn, user_id) VALUES (p_isbn, p_user_id);
    UPDATE Books SET is_issued = TRUE WHERE isbn = p_isbn;

    RETURN 'Issued!';
END;
$$ LANGUAGE plpgsql;
select issue_book('9780061122415', 'user_006');

