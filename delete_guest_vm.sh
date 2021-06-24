#!/bin/sh

echo "$(virsh  list --all)\n"
name=$(virsh list --all --name)
virsh destroy lightedge
virsh undefine lightedge
echo "Destroyed the kvm instances of $name"
echo "$(virsh  list --all)\n"
rm -rf *.qcow2
echo "Removed the qcow images of $name"
