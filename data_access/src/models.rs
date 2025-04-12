use diesel::prelude::*;

#[derive(Debug, Queryable, Identifiable, Insertable)]
#[diesel(table_name = crate::schema::authors)]
#[diesel(primary_key(author_id))]
pub struct Author {
    pub author_id: i32,
    pub author_name: String,
}
#[derive(Debug, Queryable, Identifiable, Insertable)]
#[diesel(table_name = crate::schema::publishers)]
#[diesel(primary_key(publisher_id))]
pub struct Publisher {
    pub publisher_id: i32,
    pub publisher_name: String,
}
#[derive(Debug, Queryable, Identifiable, Insertable)]
#[diesel(table_name = crate::schema::genres)]
#[diesel(primary_key(genre_id))]
pub struct Genre {
    pub genre_id: i32,
    pub genre_name: String,
}
#[derive(Debug, Queryable, Identifiable, Associations, Insertable)]
#[diesel(belongs_to(Publisher, foreign_key = publisher_id))]
#[diesel(table_name = crate::schema::books)]
#[diesel(primary_key(book_id))]
pub struct Book {
    pub book_id: i32,
    pub title: String,
    pub publisher_id: Option<i32>,
    pub isbn: Option<String>,
    pub image_path: Option<String>,
}
#[derive(Debug, Queryable, Insertable, Associations, Identifiable)]
#[diesel(belongs_to(Book, foreign_key = book_id))]
#[diesel(belongs_to(Author, foreign_key = author_id))]
#[diesel(table_name = crate::schema::author_book_link)]
#[diesel(primary_key(book_id, author_id))]
pub struct AuthorBookLink {
    pub book_id: i32,
    pub author_id: i32,
}
#[derive(Debug, Queryable, Insertable, Associations, Identifiable)]
#[diesel(belongs_to(Book, foreign_key = book_id))]
#[diesel(belongs_to(Genre, foreign_key = genre_id))]
#[diesel(table_name = crate::schema::genre_book_link)]
#[diesel(primary_key(book_id, genre_id))]
pub struct GenreBookLink {
    pub book_id: i32,
    pub genre_id: i32,
}
