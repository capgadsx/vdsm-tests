FROM labcompovirt/libvirt
label maintainer="Carlos Ponce <cponce@alumnos.inf.utfsm.cl>"

RUN yum install -y http://resources.ovirt.org/pub/yum-repo/ovirt-release42.rpm && \
    yum clean all && rm -rf /var/cache/yum

RUN yum install -y vdsm \
    yum clean all && rm -rf /var/cache/yum
