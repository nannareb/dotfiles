#!/bin/bash
#sudo vfio-bind 0000:02:00.1 0000:02:00.0 0000:09:00.0 0000:0a:00.0
sudo qemu-system-x86_64 \
-name Windows10 \
-enable-kvm -M i440-fx \
-m 8G -balloon virtio \
-qmp tcp:0.0.0.0:4444,server,nowait \
-cpu host \
-drive if=pflash,format=raw,readonly,file=/usr/share/edk2.git/ovmf-x64/OVMF-pure-efi.fd \
-smp sockets=1,cores=4,threads=2 \
-rtc base=localtime \
-device ioh3420,bus=pcie.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1 \
-device vfio-pci,host=02:00.0,bus=root.1,addr=00.0,multifunction=on \
-device vfio-pci,host=02:00.1,bus=pcie.0 \
-device vfio-pci,host=09:00.0,bus=pcie.0 \
-device vfio-pci,host=0a:00.0,bus=pcie.0 \
-boot c \
-drive file=/home/libvirt/win10.qcow2,if=virtio,cache=unsafe,aio=threads,discard=on \
-net none \
-cdrom /home/kbrennan/Downloads/Win10_1511_1_English_x64.iso \
-vga none -nographic \
-usb -device usb-host




#-device vfio-pci,host=00:1f.6,bus=pcie.0 \
#-device vfio-pci,host=02:00.0,bus=root.1,addr=00.0,multifunction=on,romfile=/vm/Gigabyte.R9390.8192.150605.rom \
#-cdrom /home/libvirt/virtio-win-0.1.113.iso \

