IMAGE=~/Documents/VM/windows-server-2008-r2.qcow2
FLOPPY=Autounattend.vfd
VIRTIO_ISO=~/Documents/ISO/virtio-win-0.1-74.iso
ISO=~/Documents/ISO/Windows_server_2008R2/Windows_Server_2008R2_SP1.iso
 
KVM=/usr/libexec/qemu-kvm
if [ ! -f "$KVM" ]; then
    KVM=/usr/bin/kvm
fi
 
qemu-img create -f qcow2 -o preallocation=metadata $IMAGE 16G
 
$KVM -m 2048 -smp 2 -cdrom $ISO -drive file=$VIRTIO_ISO,index=3,media=cdrom -fda $FLOPPY $IMAGE \
-boot d -vga std -k en-us -vnc :1
