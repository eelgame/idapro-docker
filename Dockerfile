FROM registry.cn-chengdu.aliyuncs.com/mgame/idapro-docker-base
MAINTAINER Redacted <redacted@redacted>

WORKDIR /root
# ADD id_rsa.pub /root/client.pub
ADD IDA.tar.gz /root
# RUN cat /root/client.pub >> /root/.ssh/authorized_keys

ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]
