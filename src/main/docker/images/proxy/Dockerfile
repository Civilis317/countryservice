FROM debian:jessie
MAINTAINER Civilis

RUN apt-get update && apt-get install -y apache2 && apt-get clean

ENV APACHE_LOG_DIR /var/log/apache2

RUN a2enmod proxy && a2enmod proxy_http && a2enmod headers && a2enmod ssl

RUN mkdir /etc/apache2/ssl

ADD ssl /etc/apache2/ssl
ADD sites-available/countryservice-ssl.conf /etc/apache2/sites-available/countryservice-ssl.conf
RUN rm /etc/apache2/sites-enabled/*
RUN a2ensite countryservice-ssl

ADD entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/tmp/entrypoint.sh"]

