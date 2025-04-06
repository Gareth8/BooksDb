CREATE TABLE IF NOT EXISTS authors (
    author_ID SERIAL PRIMARY KEY,
    author_name varchar (60)
);

CREATE TABLE IF NOT EXISTS publishers (
    publisher_ID SERIAL PRIMARY KEY,
    publisher_name varchar (60)
);

CREATE TABLE IF NOT EXISTS books (
    book_ID SERIAL PRIMARY KEY,
    title varchar (100) not null,
    publisher_ID INT,
    genre varchar (30) not null,
    ISBN varchar (13),
    CONSTRAINT fk_publisher
        FOREIGN KEY (publisher_ID)
            REFERENCES publishers(publisher_ID)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS author_book_link (
    book_ID INT,
    author_ID INT,
    CONSTRAINT fk_book
        FOREIGN KEY (book_ID)
            REFERENCES books(book_ID),
    CONSTRAINT fk_author
        FOREIGN KEY (author_ID)
            REFERENCES authors(author_ID)
);