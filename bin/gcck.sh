#!/usr/bin/env bash

set -x

if [ -f tags ]; then
	rm tags
fi

if [ -f cscope.out ]; then
	rm cscope*
fi

make cscope ARCH=x86_64
make tags ARCH=x86_64


