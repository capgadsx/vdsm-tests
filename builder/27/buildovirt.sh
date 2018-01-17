#!/bin/sh

set -xe

git clone https://gerrit.ovirt.org/ovirt-imageio
cd ovirt-imageio
patch -p0 < /root/suffixpatch.patch
make
make check
make rpm
