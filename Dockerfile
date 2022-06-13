FROM ubuntu:20.04

RUN apt update && apt install -y nginx curl nano

COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

# docker run -it -p 90:90 traff