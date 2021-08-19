use super::AppState;
use super::log_request;
use actix_web::{get, web, HttpResponse, Responder};

pub fn init(cfg: &mut web::ServiceConfig) {
    cfg.service(get_genmodelins_by_customer_ssn);
}

#[get("/genmodelins/{ssn}")]
async fn get_genmodelins_by_customer_ssn(customer_ssn: web::Path<i64>, app_state: web::Data<AppState<'_>>) -> impl Responder {
    log_request("GET: /genmodelins", &app_state.connections);

    let cust_genmodelin = app_state.context.genmodelins.get_genmodelin_by_customer_ssn(customer_ssn.into_inner()).await;

    match cust_genmodelin {
        Err(_) => HttpResponse::NotFound().finish(),
        Ok(cust_genmodelin) => HttpResponse::Ok().json(cust_genmodelin)
    }
}