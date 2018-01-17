from fedora:27
label maintainer="Carlos Ponce <cponce@alumnos.inf.utfsm.cl>"

run dnf install -y fedora-packager fedora-review @development-tools && dnf clean all

# ovirt-imageio dependencies

run dnf install -y m2crypto python-devel python-pip python-requests python-six \
        python-webob python3-devel python3-requests python3-six python3-systemd \
        python3-webob systemd-python openssl

# tox for running tests

run pip install tox

# build files
add buildovirt.sh /root/buildovirt.sh
add suffixpatch.patch /root/suffixpatch.patch
workdir /root
