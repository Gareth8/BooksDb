CREATE SCHEMA IF NOT EXISTS bookdb;
CREATE TABLE IF NOT EXISTS bookdb.authors
(
    author_ID   SERIAL PRIMARY KEY,
    author_name varchar(60)
);

CREATE TABLE IF NOT EXISTS bookdb.publishers
(
    publisher_ID   SERIAL PRIMARY KEY,
    publisher_name varchar(60)
);

CREATE TABLE IF NOT EXISTS bookdb.genres
(
    genre_ID   SERIAL PRIMARY KEY,
    genre_name varchar(30)
);

CREATE TABLE IF NOT EXISTS bookdb.books
(
    book_ID      SERIAL PRIMARY KEY,
    title        varchar(100) not null,
    publisher_ID INT,
    ISBN         varchar(13),
    image_path   varchar(50),
    CONSTRAINT fk_publisher
        FOREIGN KEY (publisher_ID)
            REFERENCES bookdb.publishers (publisher_ID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bookdb.author_book_link
(
    book_ID   INT,
    author_ID INT,
    CONSTRAINT fk_book
        FOREIGN KEY (book_ID)
            REFERENCES bookdb.books (book_ID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_author
        FOREIGN KEY (author_ID)
            REFERENCES bookdb.authors (author_ID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bookdb.genre_book_link
(
    book_ID  INT,
    genre_ID INT,
    CONSTRAINT fk_book
        FOREIGN KEY (book_ID)
            REFERENCES bookdb.books (book_ID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_ID)
            REFERENCES bookdb.genres (genre_ID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);