use super::GenModelIn;
use super::Table;
use sqlx::sqlite::SqliteQueryAs;

impl<'c> Table<'c, GenModelIn> {
    pub async fn get_genmodelin_by_customer_ssn(&self, cust_ssn: i64) -> Result<GenModelIn, sqlx::Error> {
        sqlx::query_as(
            r#"
            select `g`.`Age`, `g`.`Gender`, `g`.`Weight`, `g`.`Height`, `g`.`City`, `g`.`Country`, `g`.`SmokingHabits`, `g`.`CancerHistory`, `g`.`CardiovascularHistory`, `g`.`DrinkingHabits`, `g`.`ActivityHabits`
            from `GenericModelIns` as `g`
            inner join `Customer` as `c`
                on `g`.`CustSSN` = `c`.`CustSSN`
                where `g`.`CustSSN` = ?
            "#,
        )
        .bind(cust_ssn)
        .fetch_one(&*self.pool)
        .await
    }
}
