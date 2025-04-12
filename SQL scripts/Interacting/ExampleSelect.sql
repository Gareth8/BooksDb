SELECT (title, genre_name, author_name, publisher_name)
FROM books, genres, authors, publishers
WHERE title = 'The Way of Kings';