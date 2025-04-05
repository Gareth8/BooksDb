CREATE TABLE authors (
    author_ID SERIAL PRIMARY KEY,
    author_name varchar (255)
);

CREATE TABLE publishers (
    publisher_ID SERIAL PRIMARY KEY,
    publisher_name varchar (255)
);

CREATE TABLE books (
    book_ID SERIAL PRIMARY KEY,
    title varchar (100) not null,
    author_ID INT,
    publisher_ID INT,
    genre varchar (30) not null,
    ISBN varchar (13),
    CONSTRAINT fk_author
        FOREIGN KEY (author_ID)
            REFERENCES authors(author_ID)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    CONSTRAINT fk_publisher
        FOREIGN KEY (publisher_ID)
            REFERENCES publishers(publisher_ID)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);