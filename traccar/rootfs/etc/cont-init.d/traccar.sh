#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Traccar
# Ensures the user configuration file is present
# ==============================================================================

# Migrate add-on data from the Home Assistant config folder,
# to the add-on configuration folder.
if ! bashio::fs.file_exists '/config/traccar.xml' \
    && bashio::fs.file_exists '/homeassistant/traccar.xml'; then
    mv /homeassistant/traccar.xml /config/traccar.xml \
        || bashio::exit.nok "Failed to migrate Traccar configuration"
fi

# Create default config on first start
if ! bashio::fs.file_exists "/config/traccar.xml"; then
    cp /etc/traccar/traccar.xml /config/traccar.xml \
        || bashio::exit.nok "Failed to create default Traccar configuration"
fi
