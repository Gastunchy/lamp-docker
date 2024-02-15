#!/bin/bash

# Variables
REPO="bootcamp-devops-2023"
BRANCH="ejercicio2-dockeriza"
USERID=$(id -u)
DISCORD="https://discord.com/api/webhooks/1202369004023590912/b7ra6RnXn6tdldm60P3hZHpBy6bf-U2m6dG6gOE13Ar96Ngx6rfd4uQmHgiXkVxFzWLt"
source .env

# Colores
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BYELLOW='\033[1;33m'
BBLUE='\033[1;34m'
BMAGENTA='\033[1;35m'
BCYAN='\033[1;36m'
BWHITE='\033[1;37m'
NC='\033[0m'

# Validacion de usuario ROOT y variables de DB

if [ "${USERID}" -ne 0 ]; then
    echo -e "\n${BRED}Correr con usuario ROOT.${NC}"
    exit
fi

# Chequeo e instalacion de paquetes

  packages=("docker.io" "docker-compose" "git" "curl")

  for package in "${packages[@]}"; do
    dpkg -l | grep -q $package
    if [ $? -eq 0 ]; then
      echo -e "\n${BGREEN} $package ya está instalado ...${NC}"
    else
      echo -e "\n${BYELLOW}instalando $package ...${NC}"
      sudo apt-get install -y $package
      check_status $?
    fi
  done

# Clonando web

echo -e "\n${BBLUE}Descargando pagina web.${NC}"

echo -e "\n${BYELLOW}Validando informacion preexistente..${NC}"

if [ -d "${REPO}" ] || [ -d "public-html" ]; then
    echo -e "\n${BBLUE}La carpeta $REPO o public-html ya existen, seran reemplazada ...${NC}"
    rm -rf $REPO
    rm -rf public-html
fi

mkdir public-html

echo -e "\n${BYELLOW}instalando WEB ...${NC}"

git clone https://github.com/roxsross/$REPO.git -b $BRANCH

cp -r $REPO/295devops-travel-lamp/* public-html/
rm -rf $REPO

# Creacion de archivos para DB

cat << EOF > ./public-html/database/init.sql
CREATE DATABASE $DB;
CREATE USER '$USERDB'@'%' IDENTIFIED BY '$PASSDB';
GRANT ALL PRIVILEGES ON *.* TO '$USERDB'@'%';
FLUSH PRIVILEGES;
EOF

# Reparando conector PHP

sed -i "s/\(\$dbPassword *= *\).*/\1\"${PASSDB}\";/" /var/www/html/config.php
sed -i "s/localhost/server_db/g" /var/www/html/config.php
sed -i "s/codeuser/${USERDB}/g" /var/www/html/config.php

# Creando imagenes y contenedores

docker-compose up -d

# Notificacion a DISCORD

cd "$REPO"

# Obtiene el nombre del repositorio
REPO_NAME=$(basename $(git rev-parse --show-toplevel))
# Obtiene la URL remota del repositorio
REPO_URL=$(git remote get-url origin)
WEB_URL="localhost"
# Realiza una solicitud HTTP GET a la URL
HTTP_STATUS=$(curl -Is "$WEB_URL" | head -n 1)

# Verifica si la respuesta es 200 OK (puedes ajustar esto según tus necesidades)
if [[ "$HTTP_STATUS" == *"200 OK"* ]]; then
  # Obtén información del repositorio
    DEPLOYMENT_INFO2="Despliegue del repositorio $REPO_NAME: "
    DEPLOYMENT_INFO="La página web $WEB_URL está en línea."
    COMMIT="Commit: $(git rev-parse --short HEAD)"
    AUTHOR="Autor: $(git log -1 --pretty=format:'%an')"
    DESCRIPTION="Descripción: $(git log -1 --pretty=format:'%s')"
else
  DEPLOYMENT_INFO="La página web $WEB_URL no está en línea."
fi

# Obtén información del repositorio


# Construye el mensaje
MESSAGE="$DEPLOYMENT_INFO2\n$DEPLOYMENT_INFO\n$COMMIT\n$AUTHOR\n$REPO_URL\n$DESCRIPTION"

# Envía el mensaje a Discord utilizando la API de Discord
curl -X POST -H "Content-Type: application/json" \
     -d '{
       "content": "'"${MESSAGE}"'"
     }' "$DISCORD"