#!/bin/bash
dotnet /app/Cli.dll start accept status --token $TOKEN "$@" && \
sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf && \
nginx -g 'daemon off;' "$@" & echo 'done'