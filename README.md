systemd-enabled Fedora20 Docker image
=====================================

1. starts systemd
2. starts bash as root shell for development upon start of the image.

To be started like:

    $ docker run --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p systemd_fedora20

Thanks Dan Walsh. More information here:
http://developerblog.redhat.com/2014/05/05/running-systemd-within-docker-container/
