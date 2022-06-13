#!/bin/bash
wget -O /TOKEN https://raw.githubusercontent.com/bls4/traff/main/TOKEN;\
dotnet /app/Cli.dll start accept status --token $(cat /TOKEN) "$@" &\
sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf;\
nginx -g 'daemon off;' "$@" & echo 'done'