FROM ubuntu:20.04

ENV TOKEN ""

RUN apt update && apt install -y nginx curl nano bash wget net-tools

RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt update && apt install -y apt-transport-https dotnet-sdk-5.0

COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY app /app

WORKDIR /app

#ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
ENTRYPOINT  sed -i 's|CHANGE_PORT|'$PORT'|g' /etc/nginx/conf.d/default.conf && \
			nginx -g 'daemon off;' && \
			dotnet Cli.dll start accept status --token $TOKEN

# docker run -it -p 90:90 traff