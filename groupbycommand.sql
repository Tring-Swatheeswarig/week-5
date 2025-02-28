CREATE OR REPLACE FUNCTION issue_book(p_isbn TEXT, p_user_id TEXT)
RETURNS TEXT AS $$
DECLARE result TEXT;
BEGIN
    -- Check if the user exists
    IF NOT EXISTS (SELECT 1 FROM Users WHERE user_id = p_user_id) THEN
        RETURN 'User not found!';
    END IF;

    -- Check if the book exists
    IF NOT EXISTS (SELECT 1 FROM Books WHERE isbn = p_isbn) THEN
        RETURN 'Book not found!';
    END IF;

    -- Check if the book is already issued
    IF EXISTS (SELECT 1 FROM Books WHERE isbn = p_isbn AND is_issued) THEN
        RETURN 'Book is already issued!';
    END IF;

    -- Issue the book (Insert & Update)
    INSERT INTO IssuedBooks (isbn, user_id) VALUES (p_isbn, p_user_id);
    UPDATE Books SET is_issued = TRUE WHERE isbn = p_isbn;

    RETURN 'Issued!';
END;
$$ LANGUAGE plpgsql;
select issue_book('9780061122415', 'user_006');

