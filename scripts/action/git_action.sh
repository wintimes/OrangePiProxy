change_ip_git(){
echo change_ip
if [ ! -f "/home/orangepi/.gitconfig" ];then
 echo ".gitconfig not exist"

else
 echo ".gitconfig exist"
  if grep -E "proxy" "/home/orangepi/.gitconfig" > /dev/null
  then
  echo "proxy exist"
  echo -e "Enter LAN proxy ip such as 192.168.31.31"
  read ip_change
  ip_change=$(echo $ip_change)
  if [  -n "$ip_change" ];then
  change_gitproxy=$(cat "/home/orangepi/.gitconfig" | egrep -o "proxy[[:space:]]\=[[:space:]]http\:\/\/[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
   echo $change_gitproxy
   change_IP_git=$(echo ${change_gitproxy} | egrep -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
   echo $change_IP_git
   if [ "$change_IP_git" != "" ]; then   
    change_LAN_ip_git="$(printf "${green}$(echo ${change_IP_git} | cut -f1 -d ':' )${default}" )"
    echo $change_LAN_ip_git
    echo $ip_change
    sed -i 's/'"${change_LAN_ip_git}"'/'"$ip_change" '/g' "/home/orangepi/.gitconfig"
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
echo 2
}

change_ip_port_git(){
echo 3
}

change_proxy_git(){
echo 4
}