
use sqlx::sqlite::SqliteRow;
use sqlx::{FromRow, Row};

#[derive(serde::Serialize, serde::Deserialize, PartialEq, Clone)]
pub struct Product {
    pub LineOfBusiness: i64,
    pub GovtAgency: Option<String>,
    pub PSGName: Option<String>,
    pub PPGName: Option<String>,
    pub SeriesName: Option<String>,
    pub PlanName: Option<String>
}

impl<'c> FromRow<'c, SqliteRow<'c>> for Product {
    fn from_row(row: &SqliteRow) -> Result<Self, sqlx::Error> {
        Ok(Product {
            LineOfBusiness: row.get(0),
            GovtAgency: row.get(1),
            PSGName: row.get(2),
            PPGName: row.get(3),
            SeriesName: row.get(4),
            PlanName: row.get(5)
        })
    }
}