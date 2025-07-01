#!/bin/sh

# Get elasticsearch password from .env file
ENV_FILE="../../elastic-start-local/.env"

if [ -f "$ENV_FILE" ]; then
    # Extract elasticsearch password from .env file
    ES_PASSWORD=$(grep "ES_LOCAL_PASSWORD=" "$ENV_FILE" | cut -d'=' -f2)
    
    if [ -n "$ES_PASSWORD" ]; then
        echo "Elasticsearch password found"
        
        # Replace password in connections.json file
        CONFIG_FILE="./config/connections.json"
        
        if [ -f "$CONFIG_FILE" ]; then
            # Replace ELASTIC_PASSWORD with actual password
            sed -i "s/\"ELASTIC_PASSWORD\"/\"$ES_PASSWORD\"/g" "$CONFIG_FILE"
            
            echo "Password updated in connections.json file"
        else
            echo "Error: $CONFIG_FILE file not found"
            exit 1
        fi
    else
        echo "Error: Elasticsearch password not found in .env file"
        exit 1
    fi
else
    echo "Error: $ENV_FILE file not found"
    exit 1
fi

docker compose up -d