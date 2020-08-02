#Docker base OS
FROM debian:buster
MAINTAINER keungeun LEE <keulee@student.42.fr>

RUN apt-get update && apt-get install -y nginx

EXPOSE 80

WORKDIR /etc/nginx

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
