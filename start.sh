#!/bin/bash
cd "$(dirname "$0")"

# Loading variables
export $(grep -v '^#' .env | xargs)

# Copy the template to the working config
cp config.json.template config.json

# Replacing placeholders
sed -i "s|__ARMA_BIND_ADDRESS__|${ARMA_BIND_ADDRESS}|g" config.json
sed -i "s|\"__ARMA_BIND_PORT__\"|${ARMA_BIND_PORT}|g" config.json
sed -i "s|\"__ARMA_REGISTER_PORT__\"|${ARMA_REGISTER_PORT}|g" config.json
sed -i "s|__ARMA_ADMIN_PASSWORD__|${ARMA_ADMIN_PASSWORD}|g" config.json

# Starting the server
./ArmaReforgerServer -config ./config.json -profile ./profile -maxFPS 60
