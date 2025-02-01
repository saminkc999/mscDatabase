
-- No.a
SELECT bookId, title, genreCode 
FROM Book
ORDER BY title;

-- No. b
SELECT COUNT(DISTINCT p.userId) AS user_count
FROM Purchase p
JOIN Book b ON p.bookId = b.bookId
JOIN Genre g ON b.genreCode = g.genreCode
WHERE g.title = 'Fiction';

-- No. c
SELECT g.title AS genre_title, COUNT(p.bookId) AS book_purchases
FROM Purchase p
JOIN Book b ON p.bookId = b.bookId
JOIN Genre g ON b.genreCode = g.genreCode
GROUP BY g.title;

-- No. d
SELECT g.title 
FROM Purchase p
JOIN Book b ON p.bookId = b.bookId
JOIN Genre g ON b.genreCode = g.genreCode
GROUP BY g.title
HAVING COUNT(p.bookId) > 1;



