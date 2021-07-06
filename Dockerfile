FROM ubuntu:18.04
MAINTAINER Redacted <redacted@redacted>

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt install -y openssh-server \
                      xauth \
                      wine32 \
                      wine64 \
                      winetricks \
                      x11-apps \
                      software-properties-common \
                      wget \
    && wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add - \
    && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' \
    && add-apt-repository ppa:cybermax-dexter/sdl2-backport -y \
    && apt-get update -y \
    && apt install --install-recommends winehq-stable -y \
    && apt install libvulkan1 libvulkan-dev -y \
    && apt-get install winbind -y \
    && apt install mono-complete -y \
    && mkdir /var/run/sshd \
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && ssh-keygen -A \
    && sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication no/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

WORKDIR /root
ADD id_rsa.pub /root/client.pub
ADD IDA /root/IDA
RUN cat /root/client.pub >> /root/.ssh/authorized_keys

ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
