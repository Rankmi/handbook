#!/bin/bash

cd ~
echo "Clonando repositorio"
git clone https://github.com/Rankmi/app.git
echo "Instalando Nodejs"
brew install node@10.16.2
cd app
echo "Instalando dependencias del proyecto"
npm install

# Archivo hosts
echo "Debes modificar tu archivo /etc/hosts y añadir lo siguiente:"
echo "127.0.0.1   app-local.rankmi.lo"
echo "127.0.0.1   admin.rankmi.lo"
echo "127.0.0.1   api-local.rankmi.lo"
read -p "Una vez que lo hayas modificado, presiona Y: " RESPONSE
if [ RESPONSE != "Y" ]; then
    exit 1
fi

# Archivo .env
echo "Generando archivo .env ..."
touch .env
echo "API_URL = http://api-local.rankmi.lo:3000/v1" >> .env
echo "API_REPORTS_URL = http://api-local.rankmi.lo:3002/v1" >> .env
echo "APP_URL = http://app-local.rankmi.lo:9000/" >> .env
echo "ASSET_PATH = https://rankmi-prod.s3.amazonaws.com/" >> .env
echo "AVATAR_PATH = users/avatars/medium/" >> .env
echo "DEFAULT_AVATAR_PATH = default/icono-persona-01.png" >> .env
echo "ENV = local" >> .env
echo "LOCALE = es" >> .env
echo "IMAGES_PATH = /assets" >> .env
echo "PERFORMANCE_URL = http://api-local.rankmi.lo:3001/" >> .env
echo "AMPLITUDE_KEY = 40abdbef43e3a0cef42be8073167342f" >> .env
echo "CUSTOMERIO_KEY = 173186279ab890172c79" >> .env
echo "DEFAULT_SUBDOMAIN = app-local" >> .env
echo "APP_HOSTNAME = rankmi.lo:9000" >> .env
echo "NON_VERSIONED_API_URL = http://api-local.rankmi.lo:3000" >> .env
echo "NODE_ENV = test" >> .env
echo "FIREBASE_API_KEY = [REPLACE_ME_FIREBASE]" >> .env
echo "FIREBASE_AUTH_DOMAIN = rankmi-production.firebaseapp.com" >> .env
echo "FIREBASE_PROJECT_ID = rankmi-172117" >> .env
echo "FIREBASE_DATABASE_URL = https://rankmi-development.firebaseio.com" >> .env
echo "FIREBASE_STORAGE_BUCKET = rankmi-172117.appspot.com" >> .env
echo "FIREBASE_MESSAGING_SENDER_ID = 497525904370" >> .env
echo "TRANSLATIONS_API = http://localhost:4000" >> .env
echo "TRANSLATIONS_PASSWORD = [REPLACE_ME]" >> .env
echo "TRANSLATIONS_USERNAME = [REPLACE_ME]" >> .env
echo "AZURE_AD_CLIENT_ID = [REPLACE_ME_WITH_ANYTHING]" >> .env
echo "AZURE_AD_TENANT = [REPLACE_ME_WITH_ANYTHING]" >> .env

read -p "Debe remplazar los [REPLACE_ME] del archivo .env por los valores del .env del translations api. \n Presiona Y para continuar: " RESPONSE
if [ RESPONSE != "Y" ]; then
    exit 1
fi

read -p "Debe solicitar el valor de [REPLACE_ME_FIREBASE] a algún developer. Presiona Y para continuar" RESPONSE
if [ RESPONSE != "Y" ]; then
    exit 1
fi
npm run translations:upload
if [ $? -eq 0 ]; then
    npm s
else
    echo "Error al conectarse al api de traducciones. Verifica tu configuración y ejecuta npm s"
    exit 1
fi