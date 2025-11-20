FROM httpd:2.4.65-trixie

COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

RUN mkdir -p /usr/local/apache2/errors
COPY ./error/500.html /usr/local/apache2/errors/500.html
COPY ./error/EPFL_Logo_184X53.svg /usr/local/apache2/errors/EPFL_Logo_184X53.svg

# https://github.com/epfl-si/entra-id-auth-examples/tree/main/oidc/c-apache/mod_auth_openidc
RUN apt-get update && apt-get install -y libapache2-mod-auth-openidc && \
    apt-get clean all

RUN ln -s /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so