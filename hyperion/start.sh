#!/bin/sh

# Buscar senha do elasticsearch do arquivo .env
ENV_FILE="../../elastic-start-local/.env"

if [ -f "$ENV_FILE" ]; then
    # Extrair a senha do elasticsearch do arquivo .env
    ES_PASSWORD=$(grep "ES_LOCAL_PASSWORD=" "$ENV_FILE" | cut -d'=' -f2)
    
    if [ -n "$ES_PASSWORD" ]; then
        echo "Senha do Elasticsearch encontrada"
        
        # Substituir a senha no arquivo connections.json
        CONFIG_FILE="./config/connections.json"
        
        if [ -f "$CONFIG_FILE" ]; then
            # Substituir ELASTIC_PASSWORD pela senha real
            sed -i "s/\"ELASTIC_PASSWORD\"/\"$ES_PASSWORD\"/g" "$CONFIG_FILE"
            
            echo "Senha atualizada no arquivo connections.json"
        else
            echo "Erro: Arquivo $CONFIG_FILE não encontrado"
            exit 1
        fi
    else
        echo "Erro: Senha do Elasticsearch não encontrada no arquivo .env"
        exit 1
    fi
else
    echo "Erro: Arquivo $ENV_FILE não encontrado"
    exit 1
fi

docker compose up -d