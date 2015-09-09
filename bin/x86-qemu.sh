#!/usr/bin/env bash

QEMU=qemu-system-x86_64
KERNEL=bzImage
INITRD=rootfs.cpio


$QEMU -m 2048M \
  -kernel $KERNEL \
  -initrd $INITRD \
  -nographic \
  -append "console=ttyS0,115200 earlyprintk" \
  $@

