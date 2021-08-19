
use super::models::{Customer, Product, Account, JoinedAccount, GenModelIn};

pub mod db_context;
mod product_handlers;
mod customer_handlers;
mod account_handlers;
mod customer_to_account_handlers;
mod genmodelin_handlers;

pub type Database<'c> = db_context::Database<'c>;
pub type Table<'c, T> = db_context::Table<'c, T>;
pub type JoinTable<'c, T1, T2> = db_context::JoinTable<'c, T1, T2>;