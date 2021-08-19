use super::Table;
use super::Account;
use sqlx::sqlite::SqliteQueryAs;

impl<'c> Table<'c, Account> {
    pub async fn get_account_by_id(&self, account_id: i64) -> Result<Account, sqlx::Error> {
        sqlx::query_as(
            r#"
            SELECT `AccountID`, `AccountName`, `StartDate`
            FROM `Account`
            WHERE `AccountID` = ?"#
        )
        .bind(account_id)
        .fetch_one(&*self.pool)
        .await
    }
}