FROM ubuntu:24.04
ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y openssh-server python3 python3-pip

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

RUN useradd vpn
RUN mkdir /home/vpn && mkdir /home/vpn/.ssh

RUN sed -i "s/#GatewayPorts.*/GatewayPorts yes/g" /etc/ssh/sshd_config
COPY start.sh /start.sh

CMD ["/bin/bash", "/start.sh"]