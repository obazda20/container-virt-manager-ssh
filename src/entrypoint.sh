#!/bin/bash
/etc/init.d/sshd restart
wait_for_ssh=true
wait_for_ssh_exit=true

#if [ -z "$1" ]; then
#  echo "Usage: add hostname"
#  exit 1
#fi

while $wait_for_ssh; do
 echo "wait for ssh"
 if $(netstat|grep -q ESTABLISHED);then
  wait_for_ssh=false
 fi
done
 
while $wait_for_ssh_exit; do
 echo "wait for ssh exit"
 if ! $(netstat|grep -q ESTABLISHED);then
  wait_for_ssh_exit=false
 fi
done

#virt-manager -c "qemu+ssh://root@$1/system?keyfile=id_rsa"
