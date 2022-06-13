#!/bin/bash
sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf && \
nginx -g 'daemon off;'
#nginx -g 'daemon off;' "$@" & \
#dotnet /app/Cli.dll start accept status --token $TOKEN