set -xe

docker run --privileged -d \
--net=host \
--device /dev/kvm:/dev/kvm \
-v /var/lib/libvirt:/var/lib/libvirt:rw \
-v /var/run/libvirt:/var/run/libvirt:rw \
-v /sys/fs/cgroup:/sys/fs/cgroup:rw \
labcompovirt/vdsm
