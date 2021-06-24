#!/bin/sh

qemu-img create -b ubuntu-20.04-server-cloudimg-amd64.img -f qcow2 -F qcow2 snapshot-ubuntu20.qcow2 20G

cloud-localds -v --network-config=network_config_static.cfg lightedge-seed.qcow2 cloud_init.cfg


virt-install --name lightedge   --virt-type kvm --memory 8048 --vcpus 3   --boot hd,menu=on  \
--disk path=lightedge-seed.qcow2,device=cdrom \
--disk path=snapshot-ubuntu20.qcow2,device=disk \
--graphics none --os-type Linux --os-variant ubuntu20.04   --network bridge=virbr0,mac=d4:be:d9:a8:49:13 \
  --console pty,target_type=serial
#,mac=00:11:22:36:55:44
