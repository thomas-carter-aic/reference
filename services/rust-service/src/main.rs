use actix_web::{get, App, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"message": "Hello from Rust Service!"}))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("🚀 Rust service running on port 3004");
    HttpServer::new(|| App::new().service(hello))
        .bind(("0.0.0.0", 3004))?
        .run()
        .await
}
