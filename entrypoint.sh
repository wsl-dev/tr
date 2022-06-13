#!/bin/bash
sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf && \
nginx -g 'daemon off;' "$@" & \
dotnet Cli.dll start accept status --token $TOKEN