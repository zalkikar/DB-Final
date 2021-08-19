use super::AppState;
use std::sync::Mutex;

pub mod product_routes;
pub mod customer_routes;
pub mod account_routes;
pub mod genmodelin_routes;

pub use product_routes::init as init_product_controller;
pub use customer_routes::init as init_customer_controller;
pub use account_routes::init as init_account_controller;
pub use genmodelin_routes::init as init_genmodelin_controller;

fn log_request(route: &'static str, connections: &Mutex<u32>) {
    let mut con = connections.lock().unwrap();
    *con += 1;
    println!("{}\n\tconnections: {}", route, con);
}
