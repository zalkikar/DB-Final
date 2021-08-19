
use sqlx::sqlite::SqliteRow;
use sqlx::{FromRow, Row};

#[derive(serde::Serialize, serde::Deserialize, PartialEq, Clone)]
pub struct GenModelIn {
    pub Age: Option<i32>,
    pub Gender: Option<String>,
    pub Weight: Option<i32>,
    pub Height: Option<i32>,
    pub City: Option<i32>,
    pub Country: Option<i32>,
    pub SmokingHabits: Option<i32>,
    pub CancerHistory: Option<i32>,
    pub CardiovascularHistory: Option<i32>,
    pub DrinkingHabits: Option<i32>,
    pub ActivityHabits: Option<i32>
}

impl<'c> FromRow<'c, SqliteRow<'c>> for GenModelIn {
    fn from_row(row: &SqliteRow) -> Result<Self, sqlx::Error> {
        Ok(GenModelIn {
            Age: row.get(0),
            Gender: row.get(1),
            Weight: row.get(2),
            Height: row.get(3),
            City: row.get(4),
            Country: row.get(5),
            SmokingHabits: row.get(6),
            CancerHistory: row.get(7),
            CardiovascularHistory: row.get(8),
            DrinkingHabits: row.get(9),
            ActivityHabits: row.get(10)
        })
    }
}