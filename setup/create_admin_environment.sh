#!/bin/bash

cd ~
git clone https://github.com/Rankmi/rankmi-admin.git
brew install node@10.15.3
echo "Debes modificar tu archivo /etc/hosts y añadir lo siguiente:"
echo "127.0.0.1   app-local.rankmi.lo"
echo "127.0.0.1   admin.rankmi.lo"
echo "127.0.0.1   api-local.rankmi.lo"
read -p "Una vez que lo hayas modificado, presiona Y: " RESPONSE
if [ RESPONSE == "Y" ]; then
    npm install
    npm s
fi