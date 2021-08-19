use std::sync::{Arc, Mutex};
use crate::handlers::Database;

pub mod configuration;
pub mod routes;
pub mod models;
pub mod handlers;

pub struct AppState<'a> {
    pub connections: Mutex<u32>,
    pub context: Arc<Database<'a>>,
}