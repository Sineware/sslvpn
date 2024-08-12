FROM ubuntu:24.04
ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y stunnel4

RUN openssl req \
    -new \
    -newkey ec \
    -pkeyopt ec_paramgen_curve:prime256v1 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=CA/ST=Ontario/L=Toronto/O=Organization/CN=sineware-sslvpn" \
    -keyout stunnel.key \
    -out stunnel.crt
RUN cat stunnel.crt stunnel.key > stunnel.pem && mv stunnel.pem /etc/stunnel/
COPY stunnel.conf /etc/stunnel/stunnel.conf

CMD ["stunnel", "/etc/stunnel/stunnel.conf"]