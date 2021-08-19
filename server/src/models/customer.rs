use super::Account;
use super::JoinedAccount;
use sqlx::sqlite::SqliteRow;
use sqlx::{FromRow, Row};

#[derive(serde::Serialize, serde::Deserialize, PartialEq, Clone)]
pub struct Customer {
    pub CustSSN: i64,
    pub CustFirstName: Option<String>,
    pub CustMiddleInitial: Option<String>,
    pub CustSuffix: Option<String>,
    pub CustDOB: Option<i32>,
    pub Gender: Option<String>,
    pub CustSalutation: Option<String>,
    pub CustAlias: Option<String>,
    pub CustAliasSalutation: Option<String>,
    pub accounts: Vec<JoinedAccount>
}

impl<'c> FromRow<'c, SqliteRow<'c>> for Customer {
    fn from_row(row: &SqliteRow) -> Result<Self, sqlx::Error> {
        Ok(Customer {
            CustSSN: row.get(0),
            CustFirstName: row.get(1),
            CustMiddleInitial: row.get(2),
            CustSuffix: row.get(3),
            CustDOB: row.get(4),
            Gender: row.get(5),
            CustSalutation: row.get(6),
            CustAlias: row.get(7),
            CustAliasSalutation: row.get(8),
            accounts: Vec::with_capacity(0)
        })
    }
}