# Description
this container is intended to use virt-manager via local x11 forward and ssh key forwarding. My purpose is to use virt-manager under MacOS, because the brew version does not work properly.

## build

example for podman:

     cd src
     podman build -t virt-manager-ssh
    
## usage
if you use another container flavour you can change it in virt-manager.sh

    virt-manager.sh user@host

