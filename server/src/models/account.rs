
use sqlx::sqlite::SqliteRow;
use sqlx::{FromRow, Row};

#[derive(serde::Serialize, serde::Deserialize, PartialEq, Clone)]
pub struct Account {
    pub AccountID: i64,
    pub AccountName: Option<String>,
    pub StartDate: Option<i32>
}

#[derive(serde::Serialize, serde::Deserialize, PartialEq, Clone)]
pub struct JoinedAccount {
    pub AccountID: i64,
    pub AccountName: Option<String>,
    pub StartDate: Option<i32>,
    pub Type: Option<String>
}

impl<'c> FromRow<'c, SqliteRow<'c>> for Account {
    fn from_row(row: &SqliteRow) -> Result<Self, sqlx::Error> {
        Ok(Account {
            AccountID: row.get(0),
            AccountName: row.get(1),
            StartDate: row.get(2),
        })
    }
}

impl<'c> FromRow<'c, SqliteRow<'c>> for JoinedAccount {
    fn from_row(row: &SqliteRow) -> Result<Self, sqlx::Error> {
        Ok(JoinedAccount {
            AccountID: row.get(0),
            AccountName: row.get(1),
            StartDate: row.get(2),
            Type: row.get(3)
        })
    }
}
