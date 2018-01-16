FROM labcompovirt/systemd
label maintainer="Carlos Ponce <cponce@alumnos.inf.utfsm.cl>"

# USING THIS CONTAINER
#
# # docker run --privileged -d \
# 	--net=host \
#	--device /dev/kvm:/dev/kvm \
# 	-v /var/lib/libvirt:/var/lib/libvirt:rw \
# 	-v /var/run/libvirt:/var/run/libvirt:rw \
# 	-v /sys/fs/cgroup:/sys/fs/cgroup:rw \
# 	labcompovirt/libvirtd

VOLUME /var/lib/libvirt
VOLUME /var/log
VOLUME /run

RUN dnf -y install \
	libvirt \
	qemu \
	qemu-kvm \
	virt-install \
	pygobject3-base \
	&& dnf clean all

# Enable libvirtd and virtlockd services.
RUN systemctl enable libvirtd
RUN systemctl enable virtlockd

# The entrypoint.sh script runs before services start up to ensure that
# critical directories and permissions are correct.
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/sbin/init"]
