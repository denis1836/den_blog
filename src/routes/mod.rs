mod health;

use axum::{ routing::get, Router };
use sqlx::PgPool;

pub fn init_routes(pool: PgPool) -> Router {
    Router::new()
        .route("/api/health", get(health::health_check))
        .with_state(pool)
}
