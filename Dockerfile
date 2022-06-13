FROM ubuntu:20.04

RUN apt update && apt install -y nginx curl nano

#COPY index.html /usr/share/nginx/html/
#COPY nginx.conf /etc/nginx/conf.d/

CMD nginx -g "daemon off;"
#sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/nginx.conf && \
# docker run -it -p 90:90 traff
