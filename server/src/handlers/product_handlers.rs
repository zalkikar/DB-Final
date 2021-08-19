use super::Table;
use super::Product;
use sqlx::sqlite::SqliteQueryAs;

impl<'c> Table<'c, Product> {
    pub async fn get_all_products(&self) -> Result<Vec<Product>, sqlx::Error> {
        sqlx::query_as(
            r#"
            SELECT `LineOfBusiness`, `GovtAgency`, `PSGName`, `PPGName`, `SeriesName`, `PlanName`
            FROM `Product`"#
        )
        .fetch_all(&*self.pool)
        .await
    }
    pub async fn get_product_by_name(&self, plan_name: &str) -> Result<Product, sqlx::Error> {
        sqlx::query_as(
            r#"
            SELECT `LineOfBusiness`, `GovtAgency`, `PSGName`, `PPGName`, `SeriesName`, `PlanName`
            FROM `Product`
            WHERE `PlanName` = ?"#
        )
        .bind(plan_name)
        .fetch_one(&*self.pool)
        .await
    }
}