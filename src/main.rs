use axum::{routing::get, Router};
use std::{env, net::SocketAddr};

async fn hello() -> &'static str {
    "Hello from Axum on Cloud Run!"
}

#[tokio::main]
async fn main() {
    let port  = env::var("PORT").unwrap_or_else(|_| "8080".to_string());
    let addr = SocketAddr::from(([0, 0, 0, 0], port.parse().unwrap()));

    let app = Router::new().route("/", get(hello));

    println!("Listening on {}", addr);
    axum_server::bind(addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
