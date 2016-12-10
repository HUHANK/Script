#!/bin/bash

# 删除所有文件，出去自己和指定的文件

EXECLUDE="$(basename $0)"

for arg in "$@" ; do
	if [ -f $arg ];then
		EXECLUDE="$EXECLUDE|$arg"
	fi
done
#ls . | egrep -v "($EXECLUDE)"

rm -rf `ls . | egrep -v "($EXECLUDE)"`



