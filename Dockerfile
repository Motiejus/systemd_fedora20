# Thanks to Dan Walsh <dwalsh@redhat.com>
# http://developerblog.redhat.com/2014/05/05/running-systemd-within-docker-container/

FROM fedora:20
MAINTAINER "Motiejus Jakštys" <motiejus.jakstys@spilgames.com>
ENV container docker
RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; \
    for i in *; do \
        [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; \
    done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

ADD bash-shell.service /etc/systemd/system/
RUN systemctl enable bash-shell.service

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
