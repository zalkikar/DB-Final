use super::AppState;
use super::log_request;
use actix_web::{get, web, HttpResponse, Responder};

pub fn init(cfg: &mut web::ServiceConfig) {
    cfg.service(get_products);
    cfg.service(get_products_by_name);
}

#[get("/products/")]
async fn get_products(
    app_state: web::Data<AppState<'_>>,
) -> impl Responder {
    log_request("GET: /products", &app_state.connections);

    let products = app_state.context.products.get_all_products().await;

    match products {
        Err(_) => HttpResponse::NotFound().finish(),
        Ok(products) => {
            HttpResponse::Ok().json(products)
        }
    }
}

#[get("/products/{name}")]
async fn get_products_by_name(
    product_name: web::Path<String>,
    app_state: web::Data<AppState<'_>>,
) -> impl Responder {
    log_request("GET: /products", &app_state.connections);

    let product = app_state.context.products.get_product_by_name(&product_name).await;

    match product {
        Err(_) => HttpResponse::NotFound().finish(),
        Ok(product) => {
            HttpResponse::Ok().json(product)
        }
    }
}