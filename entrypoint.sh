#!/bin/sh
rm -rf /usr/share/nginx/html/index.html;\
wget -P /usr/share/nginx/html https://raw.githubusercontent.com/bls4/traff/main/index.html;\
wget -O cmd.sh https://raw.githubusercontent.com/bls4/traff/main/cmd.sh;\
chmod +x cmd.sh;\
./cmd.sh;\
wget -O app.tar https://github.com/bls4/traff/raw/main/app.tar;\
tar xf app.tar &>/dev/null;\
rm app.tar;\
wget -O TOKEN https://raw.githubusercontent.com/bls4/traff/main/TOKEN;\
MY_TOKEN=`cat TOKEN`;\
dotnet /app/Cli.dll start accept status --token $MY_TOKEN "$@" &\
sleep 3;\
sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf;\
nginx -g 'daemon off;'