FROM ubuntu:20.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get update && apt-get install -y lib32z1 xinetd wget netcat curl lsof systemctl supervisor

RUN useradd -m ctf
WORKDIR /home/ctf
RUN cp -R /usr/lib* /home/ctf

RUN mkdir /home/ctf/dev && \
    mknod /home/ctf/dev/null c 1 3 && \
    mknod /home/ctf/dev/zero c 1 5 && \
    mknod /home/ctf/dev/random c 1 8 && \
    mknod /home/ctf/dev/urandom c 1 9 && \
    chmod 666 /home/ctf/dev/*

#bin files
RUN mkdir /home/ctf/bin

RUN cp /bin/bash /home/ctf/bin && \
    cp /bin/sh /home/ctf/bin && \
    cp /usr/bin/timeout /home/ctf/bin && \
    cp /bin/ls /home/ctf/bin && \
    cp /bin/cat /home/ctf/bin && \
    cp /bin/wget /home/ctf/bin

#remove not have
RUN rm -rf /home/ctf/lib/apt /home/ctf/lib/cpp /home/ctf/lib/gnupg /home/ctf/lib/init /home/ctf/lib/lsb /home/ctf/lib/os-release /home/ctf/lib/rsyslog /home/ctf/lib/tc /home/ctf/lib/udev /home/ctf/lib/binfmt.d /home/ctf/lib/dpkg /home/ctf/lib/gold-ld /home/ctf/lib/initramfs-tools /home/ctf/lib/ldscripts /home/ctf/lib/mime /home/ctf/lib/python2.7 /home/ctf/lib/systemd /home/ctf/lib/terminfo /home/ctf/lib/compat-ld /home/ctf/lib/gcc /home/ctf/lib/ifupdown /home/ctf/lib/insserv /home/ctf/lib/locale /home/ctf/lib/modules-load.d /home/ctf/lib/python3 /home/ctf/lib/tar /home/ctf/lib/tmpfiles.d


COPY ./super.conf /super.conf
COPY ./start.sh /start.sh

RUN chmod +x /home/ctf/* && \
    chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf

RUN touch /home/ctf/* && \
    touch /home/ctf/*/*

RUN touch /var/run/supervisor.sock && \
    chmod 777 /var/run/supervisor.sock && \
    chmod 777 /var/run && \
    chmod 777 /var/log

RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail
RUN echo 'ctf - nproc 1500' >>/etc/security/limits.conf

RUN chmod +x /start.sh
COPY ./bin/ /home/ctf/

RUN chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf && \
    touch /home/ctf/flag  && \
    chmod 777 /home/ctf/flag 

ENTRYPOINT [ "/bin/bash" ,"/start.sh"]

EXPOSE 9999 
