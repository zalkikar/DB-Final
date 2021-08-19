
use actix_web::{web, App, HttpServer};
use insuranceapi::configuration::get_configuration;
use insuranceapi::handlers::Database;
use insuranceapi::{routes, AppState};
use std::sync::{Arc, Mutex};


#[actix_web::main]
async fn main() -> std::io::Result<()> {
    env_logger::init();


    let configuration = get_configuration().expect("Failed to read configuration.");

    let connection_str = String::from(&configuration.database.connection_string());
    log::info!(target: "connection string", "connecting to {:?}", connection_str);

    let db_context = Database::new(&configuration.database.connection_string())
        .await;


    // Instantiate the app_state. This application state will be cloned for each Actix thread but
    // the Arc of the DbContext will be reused in each Actix thread.
    let app_state = web::Data::new(AppState {
        connections: Mutex::new(0),
        context: Arc::new(db_context),
    });

    let url: String = format!("{0}:{1}", "127.0.0.1", configuration.application_port);

    println!("{0}",url);

    // Start the web application.
    // We'll need to transfer ownership of the AppState to the HttpServer via the `move`.
    // Then we can instantiate our controllers.
    let app = HttpServer::new(move || {
        App::new()
            .app_data(app_state.clone())
            .configure(routes::init_product_controller)
            .configure(routes::init_customer_controller)
            .configure(routes::init_account_controller)
            .configure(routes::init_genmodelin_controller)
    })
    .bind(url)?;
    println!("Listening on: {0}", configuration.application_port);

    app.run().await

}