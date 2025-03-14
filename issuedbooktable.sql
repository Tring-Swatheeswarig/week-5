CREATE TABLE IssuedBooks (
    issue_id SERIAL PRIMARY KEY,
    isbn VARCHAR(20) REFERENCES Books(isbn) ON DELETE CASCADE,
    user_id VARCHAR(50) REFERENCES Users(user_id) ON DELETE CASCADE,
    issue_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
