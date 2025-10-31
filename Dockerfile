FROM php:8.3.27-apache-trixie

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./oidc.conf /etc/apache2/conf-available/oidc.conf

# https://github.com/epfl-si/entra-id-auth-examples/tree/main/oidc/c-apache/mod_auth_openidc
RUN apt-get update && apt-get install -y libapache2-mod-auth-openidc && \
    apt-get clean all

RUN a2enmod auth_openidc
RUN a2enconf oidc