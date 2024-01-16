#!/bin/bash
container_flavour=podman

if [ -z "$1" ]; then
 echo Usage
 echo virt-manager.sh user@host
 echo if you use it without user@ root is the default value
 exit 0
fi

get_host=$1

if grep -q "@" <<< "$get_host"; then
  host=$get_host
else
  host=$(echo root@${get_host})
fi

${container_flavour} run --rm -it  -p 2222:22 -d virt-manager-ssh 
ssh virt-manager@localhost -p 2222 -o StrictHostKeyChecking=no -o ForwardAgent=yes -o ForwardX11=yes -o UserKnownHostsFile=/dev/null virt-manager -c "qemu+ssh://${host}/system?keyfile=id_rsa"
