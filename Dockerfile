FROM ubuntu:20.04

RUN apt update && apt install -y nginx curl nano

COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html


CMD sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf && \
	nginx -g 'daemon off;'

# docker run -it -p 90:90 traff