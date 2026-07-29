use axum::{ extract::State, Json };
use sqlx::PgPool;

pub async fn health_check(State(pool): State<PgPool>) -> Json<bool> {
    tracing::debug!("recieved health check");

    match sqlx::query("SELECT NOW;").execute(&pool).await {
        Ok(_) => Json(true),
        Err(e) => {
            tracing::error!("Failed to fetch db health: {}", e);
            Json(false)
        }
    }
}
