change_ip_git(){
if [ ! -f "$gitconfigDir" ];then
 echo ".gitconfig not exist"
else
 #echo ".gitconfig exist"
  if grep -E "proxy" "$gitconfigDir" > /dev/null
  then
  #echo "proxy exist"
  echo -e "Enter LAN proxy ip such as 192.168.31.31"
  read ip_change
  ip_change=$(echo $ip_change)
  if [  -n "$ip_change" ];then
   change_gitproxy=$(cat "$gitconfigDir" | egrep -o "proxy[[:space:]]\=[[:space:]]http\:\/\/[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
   change_IP_git=$(echo ${change_gitproxy} | egrep -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
   if [ "$change_IP_git" != "" ]; then   
    change_LAN_ip_git="$(echo ${change_IP_git} | cut -f1 -d ':' )"
    sed -i "s/$change_LAN_ip_git/$ip_change/g" "$gitconfigDir"
   fi
  else
   echo error
  fi
  else
  echo "proxy not exist"
 fi 
fi
}


change_port_git(){
if [ ! -f "$gitconfigDir" ];then
 echo ".gitconfig not exist"
else
 #echo ".gitconfig exist"
  if grep -E "proxy" "$gitconfigDir" > /dev/null
  then
  #echo "proxy exist"
  echo -e "Enter LAN proxy port such as 8188"
  read port_change
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
}

change_ip_port_git(){
in_developing
while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in           
    B|b)
        clear; git_menu; break;;
    esac
  done
}

change_proxy_git(){
in_developing
while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in           
    B|b)
        clear; git_menu; break;;
    esac
  done
}

unset_proxy_git(){
in_developing
while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in           
    B|b)
        clear; git_menu; break;;
    esac
  done

}
