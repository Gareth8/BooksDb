SELECT (books.title, authors.author_name, publishers.publisher_name)
FROM books, authors, publishers
WHERE title = 'The Way of Kings';