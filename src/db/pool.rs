use sqlx::postgres::{ PgPool, PgPoolOptions };
use std::time::Duration;

pub async fn init_pool(database_url: &str) -> PgPool {
    PgPoolOptions::new()
        .max_connections(7)
        .acquire_timeout(Duration::from_secs(3))
        .connect(database_url)
        .await
        .expect("Failed to connect with db")
}
