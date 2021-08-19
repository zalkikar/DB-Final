
#[derive(serde::Deserialize)] // serde is framework for serializing and deserializing rust data structures
pub struct Settings {
    pub database: DatabaseSettings,
    pub application_port: u16
}

//note: serialization is process of oonverting object to stream of bytes to store obj or transmit to memory

#[derive(serde::Deserialize)]
pub struct DatabaseSettings {
    pub database_name: String,
}

// adds methods to struct that arent available to other types or traits
impl DatabaseSettings {
    pub fn connection_string(&self) -> String {
        format!(
            "sqlite:{}.db",
            self.database_name
        )
    }
}

pub fn get_configuration() -> Result<Settings, config::ConfigError> {
    let mut settings = config::Config::default(); //mutable

    settings.merge(
        config::File::with_name(
            "./src/config/configuration.yaml"
        ).required(true)
    )?;

    settings.try_into()
}