use super::Table;
use super::Customer;
use sqlx::sqlite::SqliteQueryAs;

impl<'c> Table<'c, Customer> {
    pub async fn get_customer_by_ssn(&self, cust_ssn: i64) -> Result<Customer, sqlx::Error> {
        sqlx::query_as(
            r#"
            SELECT `CustSSN`, `CustFirstName`, `CustMiddleInitial`, `CustSuffix`, `CustDOB`, `Gender`, `CustSalutation`, `CustAlias`, `CustAliasSalutation`
            FROM `Customer`
            WHERE `CustSSN` = ?"#
        )
        .bind(cust_ssn)
        .fetch_one(&*self.pool)
        .await
    }
}