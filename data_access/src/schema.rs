// @generated automatically by Diesel CLI.

// This was not generated automatically by the Diesel CLI
diesel::table! {
    bookSchema.authors (author_id) {
        author_id -> Int4,
        author_name -> Varchar,
    }
}

diesel::table! {
    bookSchema.publishers (publisher_id) {
        publisher_id -> Int4,
        publisher_name -> Varchar,
    }
}

diesel::table! {
    bookSchema.genres (genre_id) {
        genre_id -> Int4,
        genre_name -> Varchar,
    }
}

diesel::table! {
    bookSchema.books (book_id) {
        book_id -> Int4,
        title -> Varchar,
        publisher_id -> Nullable<Int4>,
        isbn -> Nullable<Varchar>,
        image_path -> Nullable<Varchar>,
    }
}

diesel::table! {
    bookSchema.author_book_link (book_id, author_id) {
        book_id -> Int4,
        author_id -> Int4,
    }
}

diesel::table! {
    bookSchema.genre_book_link (book_id, genre_id) {
        book_id -> Int4,
        genre_id -> Int4,
    }
}

diesel::joinable!(books -> publishers (publisher_id));
diesel::joinable!(author_book_link -> authors (author_id));
diesel::joinable!(author_book_link -> books (book_id));
diesel::joinable!(genre_book_link -> genres (genre_id));
diesel::joinable!(genre_book_link -> books (book_id));

diesel::allow_tables_to_appear_in_same_query!(
    authors,
    publishers,
    genres,
    books,
    author_book_link,
    genre_book_link,
);
