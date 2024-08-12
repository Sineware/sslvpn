FROM ubuntu:24.04
ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y sslh

CMD ["sslh", "--user", "sslh", "--listen", "0.0.0.0:8080", "--ssh", "sshd:22", "--http", "httpd:80", "--pidfile", "/var/run/sslh/sslh.pid", "--foreground"]