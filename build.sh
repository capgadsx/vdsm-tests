set -xe

imagetag="labcompovirt"

color_yellow='\033[1;33m'
color_cyan='\033[1;36m'
color_green='\033[1;32m'
color_normal='\033[0m'

function build_image()
{
    echo -e $color_yellow"Building docker image for $1...$color_normal"
    docker build -t $imagetag/$1 $1
    echo -e $color_green"Done building docker image for $1$color_normal"
}

function clean_old_images()
{
    echo -e $color_cyan"Cleaning old images..."$color_normal
    docker rmi $(docker images -f dangling=true -q)
    echo -e $color_green"Done."$color_normal
}

build_image "systemd"
build_image "libvirt"
clean_old_images
