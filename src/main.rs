mod db;
mod routes;
mod utils;

use std::net::SocketAddr;

#[tokio::main]
async fn main() {
    dotenvy::dotenv().ok();

    tracing_subscriber::fmt::init();
    utils::print_banner("Den Blog Backend");

    let database_url = std::env::var("DATABASE_URL")
        .expect("Variable DATABASE_URL was not found in .env");

    tracing::info!("Initialazing db connection");
    let pool = db::pool::init_pool(&database_url).await;
    tracing::info!("DB connection succesfull");

    let app = routes::init_routes(pool);

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    tracing::info!("http listener active on: {}", addr.port());

    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}
