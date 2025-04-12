use std::process::id;
use data_access::models::*;
use diesel::prelude::*;
use data_access::*;

fn main() {
    use data_access::schema::books::dsl::*;

    let connection = &mut establish_connection();
    let results = books
        .limit(5)
        .load::<Book>(connection);
        let expected_data = vec![
            Book { book_id: 1, title: String::from("The Way of Kings"), publisher_id: None, isbn: None, image_path: None },
        ];
    println!("{:?}", results);
}