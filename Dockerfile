FROM ubuntu:20.04

RUN apt update && apt install -y nginx curl nano

COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/

ENV NGINX_PORT = $PORT

CMD sed -i 's|CHANGE_PORT|NGINX_PORT|g' /etc/nginx/conf.d/nginx.conf && \
	nginx -g daemon off

# docker run -it -p 90:90 traff
