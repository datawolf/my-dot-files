#!/usr/bin/env bash

CPIO_FILE=$1
FILE_LISTS=$2

cpio -o -A -v -H newc --file=$CPIO_FILE  < $FILE_LISTS
