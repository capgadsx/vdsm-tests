#!/bin/sh

set -xe

git clone https://gerrit.ovirt.org/ovirt-imageio
cd ovirt-imageio
patch -p0 < /root/suffixpatch.patch
make
make check
make rpm
for dir in common daemon proxy; do \
    cp $dir/dist/*.rpm /results/; \
done

dnf install -y /results/ovirt-imageio-common*.noarch.rpm    # For vdsm
cd /root/

git clone http://gerrit.ovirt.org/p/vdsm.git
cd vdsm
dnf install -y `cat automation/check-patch.packages.fc27`
./autogen.sh --system --enable-hooks
./configure
make
make check
make rpm
