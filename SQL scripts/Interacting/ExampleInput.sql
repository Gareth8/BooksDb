INSERT INTO bookdb.books (title, isbn)
VALUES ('The Way of Kings', 9780634079863);

INSERT INTO bookdb.authors (author_name)
VALUES ('Brandon Sanderson');

INSERT INTO bookdb.publishers (publisher_name)
VALUES ('Gollancz');

INSERT INTO bookdb.genres (genre_name)
VALUES ('Fantasy');

UPDATE bookdb.books
SET publisher_id = (SELECT publisher_id FROM bookdb.publishers WHERE publisher_name = 'Gollancz')
WHERE title = 'The Way of Kings';

INSERT INTO bookdb.author_book_link
VALUES ((SELECT book_id FROM bookdb.books WHERE title = 'The Way of Kings'),
        (SELECT author_id FROM bookdb.authors WHERE author_name = 'Brandon Sanderson'));

INSERT INTO bookdb.genre_book_link
VALUES ((SELECT book_id FROM bookdb.books WHERE title = 'The Way of Kings'),
        (SELECT genre_id FROM bookdb.genres WHERE genre_name = 'Fantasy'));