use super::AppState;
use super::log_request;
use actix_web::{get, web, HttpResponse, Responder};

pub fn init(cfg: &mut web::ServiceConfig) {
    cfg.service(get_accounts_by_id);
}

#[get("/accounts/{id}")]
async fn get_accounts_by_id(
    account_id: web::Path<i64>,
    app_state: web::Data<AppState<'_>>,
) -> impl Responder {
    log_request("GET: /accounts", &app_state.connections);

    let account = app_state.context.accounts.get_account_by_id(account_id.into_inner()).await;

    match account {
        Err(_) => HttpResponse::NotFound().finish(),
        Ok(account) => {
            HttpResponse::Ok().json(account)
        }
    }
}
