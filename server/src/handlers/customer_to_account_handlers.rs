use super::Account;
use super::Customer;
use super::JoinedAccount;
use super::JoinTable;
use sqlx::sqlite::SqliteQueryAs;

impl<'c> JoinTable<'c, Customer, Account> {
    pub async fn get_account_by_customer_ssn(&self, customer_ssn: i64) -> Result<Vec<JoinedAccount>, sqlx::Error> {
        sqlx::query_as(
            r#"
            select `a`.`AccountID`, `a`.`AccountName`, `a`.`StartDate`, `b`.`Type`
            from `Account` as `a`
            inner join `CUSTOMER_MEMBER_ACCOUNT` as `b`
                on `a`.`AccountID` = `b`.`AccountID`
                where `b`.`CustSSN` = ?
            "#,
        )
        .bind(customer_ssn)
        .fetch_all(&*self.pool)
        .await
    }
}