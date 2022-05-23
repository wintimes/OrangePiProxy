#!/bin/bash
gitconfigDir=$( find /home -name ".gitconfig" )
if [ ! -f "$gitconfigDir" ];then
 echo ".gitconfig not exist,you don't need to unset proxy!"
else
 #echo ".gitconfig exist"
  if grep -E "proxy" "$gitconfigDir" > /dev/null
  then
  #echo "proxy exist"
  echo -e "Do you want to unset proxy (y/n)"
  read unset_change
  port_change=$(echo $port_change)
  if [  -n "$port_change" ];then
   change_gitproxy=$(cat "$gitconfigDir" | egrep -o "proxy[[:space:]]\=[[:space:]]http\:\/\/[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
   change_IP_git=$(echo ${change_gitproxy} | egrep -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
   if [ "$change_IP_git" != "" ]; then   
    change_LAN_port_git="$(echo ${change_IP_git} | cut -f2 -d ':' )"
    echo change_LAN_port_git is $change_LAN_port_git
    echo port_change is $port_change
    sed -i "s/$change_LAN_port_git/$port_change/g" "$gitconfigDir"
   fi
  else
   echo error
  fi
  else
  echo "proxy not exist"
 fi 
fi