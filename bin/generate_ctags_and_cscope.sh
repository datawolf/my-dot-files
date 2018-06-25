#!/usr/bin/env bash

set -x 

if [ -f tags ]; then
	rm tags
fi

if [ -f cscope.out ]; then
	rm cscope.out 
fi

if [ -f cscope.out.in ]; then
	rm cscope.out.in 
fi

if [ -f cscope.out.po ]; then
	rm cscope.out.po 
fi

cscope -Rbqk -f cscope.out
#make cscope ARCH=arm
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
#make tags ARCH=arm


