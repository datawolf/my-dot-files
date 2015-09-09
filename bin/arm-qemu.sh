#!/usr/bin/env bash

QEMU=qemu-system-arm
KERNEL=uImage
INITRD=initrd.img

$QEMU -m 2048m \
  -M vexpress-a15  \
  -kernel $KERNEL \
  -initrd $INITRD\
  -nographic \
  -append "earlyprintk"\
  -smp 4 \
  $@

