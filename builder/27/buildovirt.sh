#!/bin/sh

set -xe

git clone https://gerrit.ovirt.org/ovirt-imageio
cd ovirt-imageio
make
make check
