use super::{Customer, Product, Account, GenModelIn};
use std::sync::Arc;
use sqlx::sqlite::SqliteRow;
use sqlx::{FromRow, SqlitePool};



pub struct Table<'c, T>
where
    T: FromRow<'c, SqliteRow<'c>>,
{
    pub pool: Arc<SqlitePool>,
    _from_row: fn(&SqliteRow<'c>) -> Result<T, sqlx::Error>,
}

impl<'c, T> Table<'c, T>
where
    T: FromRow<'c, SqliteRow<'c>>,
{
    fn new(pool: Arc<SqlitePool>) -> Self {
        Table {
            pool,
            _from_row: T::from_row,
        }
    }
}



pub struct JoinTable<'c, T1, T2>
where
    T1: FromRow<'c, SqliteRow<'c>>,
    T2: FromRow<'c, SqliteRow<'c>>,
{
    pub pool: Arc<SqlitePool>,
    _from_row: (
        fn(&SqliteRow<'c>) -> Result<T1, sqlx::Error>,
        fn(&SqliteRow<'c>) -> Result<T2, sqlx::Error>,
    ),
}

impl<'c, T1, T2> JoinTable<'c, T1, T2>
where
    T1: FromRow<'c, SqliteRow<'c>>,
    T2: FromRow<'c, SqliteRow<'c>>,
{
    fn new(pool: Arc<SqlitePool>) -> Self {
        JoinTable {
            pool,
            _from_row: (T1::from_row, T2::from_row),
        }
    }
}




pub struct Database<'c> {
    pub products: Arc<Table<'c, Product>>,
    pub customers: Arc<Table<'c, Customer>>,
    pub accounts: Arc<Table<'c, Account>>,
    pub genmodelins: Arc<Table<'c, GenModelIn>>,
    pub customers_to_accounts: Arc<JoinTable<'c, Customer, Account>>,
}

impl Database<'_> {
    pub async fn new(sql_url: &str) -> Database<'_> {
        let pool = SqlitePool::new(sql_url).await.unwrap();
        let pool = Arc::new(pool);

        Database {
            products: Arc::from(Table::new(pool.clone())),
            customers: Arc::from(Table::new(pool.clone())),
            accounts: Arc::from(Table::new(pool.clone())),
            genmodelins: Arc::from(Table::new(pool.clone())),
            customers_to_accounts: Arc::from(JoinTable::new(pool.clone()))
        }
    }
}