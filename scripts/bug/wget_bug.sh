#!/bin/bash
rm_blank(){
rm -rf "${HOME}/wgetrc.bak"
cat /etc/wgetrc  | egrep -o "^#use_proxy\s\=\son">> ${HOME}/wgetrc.bak
cd ${HOME}
for a in *;do
if [ ! -s $a ];then
rm -rf $a
fi
done
}
rm_blank