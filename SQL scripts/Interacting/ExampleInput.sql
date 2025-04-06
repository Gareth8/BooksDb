INSERT INTO books (title, genre, isbn)
VALUES ('The Way of Kings','Fantasy', 9780634079863);

INSERT INTO authors (author_name)
VALUES ('Brandon Sanderson');

INSERT INTO publishers (publisher_name)
VALUES ('Gollancz');

UPDATE books SET publisher_id = (
    SELECT publisher_id FROM publishers WHERE publisher_name = 'Gollancz')
    WHERE title = 'The Way of Kings';

INSERT INTO author_book_link
VALUES (
        (SELECT book_id FROM books WHERE title = 'The Way of Kings'),
        (SELECT author_id FROM authors WHERE author_name = 'Brandon Sanderson')
);