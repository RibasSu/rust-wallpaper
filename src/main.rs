use actix_web::{web, App, HttpServer, Result, HttpResponse, middleware::Logger};
use std::io;

// Incluir os arquivos estáticos no binário
static INDEX_HTML: &str = include_str!("../static/index.html");
static SCRIPT_JS: &str = include_str!("../static/script.js");
static STYLE_CSS: &str = include_str!("../static/style.css");

async fn index() -> Result<HttpResponse> {
    Ok(HttpResponse::Ok()
        .content_type("text/html; charset=utf-8")
        .body(INDEX_HTML))
}

async fn script_js() -> Result<HttpResponse> {
    Ok(HttpResponse::Ok()
        .content_type("application/javascript; charset=utf-8")
        .body(SCRIPT_JS))
}

async fn style_css() -> Result<HttpResponse> {
    Ok(HttpResponse::Ok()
        .content_type("text/css; charset=utf-8")
        .body(STYLE_CSS))
}

#[actix_web::main]
async fn main() -> io::Result<()> {
    env_logger::init_from_env(env_logger::Env::new().default_filter_or("info"));

    let port = std::env::var("PORT")
        .unwrap_or_else(|_| "56901".to_string())
        .parse()
        .unwrap_or(56901);
    
    println!("🚀 Servidor rodando na porta {}", port);
    println!("📱 Acesse: http://localhost:{}", port);
    
    HttpServer::new(|| {
        App::new()
            .wrap(Logger::default())
            .route("/", web::get().to(index))
            .route("/index.html", web::get().to(index))
            .route("/script.js", web::get().to(script_js))
            .route("/style.css", web::get().to(style_css))
    })
    .bind(("0.0.0.0", port))?
    .run()
    .await
}
