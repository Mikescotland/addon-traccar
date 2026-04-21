#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Traccar
# Ensures the user configuration file is present
# ==============================================================================
declare host
declare password
declare port
declare username

# Migrate add-on data from the Home Assistant config folder,
# to the add-on configuration folder.
if ! bashio::fs.directory_exists '/config/traccar.xml' \
    && bashio::fs.file_exists '/homeassistant/traccar.xml'; then
    mv /homeassistant/traccar.xml /config/traccar.xml \
        || bashio::exit.nok "Failed to migrate Traccar configuration"
fi

if ! bashio::fs.file_exists "/config/traccar.xml"; then
    cp /etc/traccar/traccar.xml /config/traccar.xml
else
    # Existing installation
    
fi
