systemd-enabled Fedora20 Docker image
=====================================

*New: does not require `--privileged`.*

1. starts systemd
2. starts bash as root shell for development upon start of the image.
3. can start something else not bash; controlled by `$MYINIT` env variable.

For systemd and shell, start like:

    $ docker run -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
                 -v `mktemp -d`:/run \
                 -ti motiejus/systemd_fedora20

This will start the whole systemd hierarchy, run "uname -a" and terminate:

    $ docker run -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
                 -v `mktemp -d`:/run \
                 -ti motiejus/systemd_fedora20 \
                 init systemd.setenv=MYINIT="uname -a"


Thanks [Dan Walsh](http://developerblog.redhat.com/2014/05/05/running-systemd-within-docker-container/) for helping to get started.
