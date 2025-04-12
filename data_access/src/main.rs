use tokio_postgres::{NoTls, Error};

struct Author {
    author_id: i32,
    name: String
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    let (client, connection) =
        tokio_postgres::connect("host=localhost user=postgres password=password dbname=bookdb", NoTls).await?;

    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("connection error: {}", e);
        }
    });

    for row in client.query("SELECT author_id, author_name FROM bookschema.authors", &[]).await? {
        let author = Author {
            author_id: row.get(0),
            name: row.get(1),
        };
        println!("Author {} has id {}", author.name, author.author_id);
    }
    Ok(())
}
