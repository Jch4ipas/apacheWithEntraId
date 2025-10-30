FROM httpd:2.4.65-trixie

COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

# https://github.com/epfl-si/entra-id-auth-examples/tree/main/oidc/c-apache/mod_auth_openidc
RUN apt-get update && apt-get install -y libapache2-mod-auth-openidc && \
    apt-get clean all

RUN ln -s /usr/lib/apache2/modules/mod_auth_openidc.so /usr/local/apache2/modules/mod_auth_openidc.so

# RUN httpd -t
# RUN set -eux; \
#     VERSION="2.4.18.1"; \
#     CODENAME="trixie"; \
#     FILE="libapache2-mod-auth-openidc_${VERSION}-1.${CODENAME}_amd64.deb"; \
#     URL="https://github.com/OpenIDC/mod_auth_openidc/releases/download/v${VERSION}/${FILE}"; \
#     wget --content-disposition "$URL"; \
#     file libapache2-mod-auth-openidc_2.4.18.1-1_trixie_amd64.deb; \
#     apt-get update && apt install -y "./${FILE}"; \
#     rm "${FILE}" && apt-get clean