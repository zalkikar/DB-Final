use super::AppState;
use super::log_request;
use actix_web::{get, web, HttpResponse, Responder};

pub fn init(cfg: &mut web::ServiceConfig) {
    cfg.service(get_customers_by_ssn);
}

#[get("/customers/{ssn}")]
async fn get_customers_by_ssn(
    customer_ssn: web::Path<i64>,
    app_state: web::Data<AppState<'_>>,
) -> impl Responder {
    log_request("GET: /customers", &app_state.connections);

    let cust_ssn = customer_ssn.into_inner();
    let customer = app_state.context.customers.get_customer_by_ssn(cust_ssn).await;

    match customer {
        Err(_) => HttpResponse::NotFound().finish(),
        Ok(mut customer) => {
            let accounts = app_state
                .context
                .customers_to_accounts
                .get_account_by_customer_ssn(cust_ssn)
                .await;

            match accounts {
                Err(_) => HttpResponse::NotFound().finish(),
                Ok(accounts) => {
                    customer.accounts = accounts;
                    HttpResponse::Ok().json(customer)
                }
            }
        }
    }
}