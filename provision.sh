#!/bin/bash

echo "Actualizando paquetes del sistema..."
apt-get update

echo "Instalando Docker, Docker Compose y Git..."
apt-get install -y docker.io docker-compose-v2 git

usermod -aG docker vagrant

cd /vagrant

echo "Desplegando los contenedores mediante docker-compose..."
if [ -f "docker-compose.yml" ]; then
    docker compose up -d --build
    
    docker compose run --rm git-sync
else
    echo "Aviso: No se encuentra el archivo docker-compose.yml en la carpeta /vagrant"
fi