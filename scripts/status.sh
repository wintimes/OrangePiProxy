wget_status(){
if grep -E "^#use_proxy\s\=\son" "/etc/wgetrc" > /dev/null 
then
#exist   #
 #echo "notsetup"
   LAN_ip_wget="${red}Not Setup  ${default}  "
   PROXY_port_wget="${red}Not Setup  ${default}"
   wget_proxy_status="${red}Not Setup    ${default}" 
else
#no exist   #
 #echo 0
 #echo "on_off"
  IP_wget=$(cat /etc/wgetrc  | egrep -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}" | awk '{arr[$0] = $0}END{for(i in arr) { print arr[i]}}')
  if grep -E "^use_proxy\s\=\son$" "/etc/wgetrc" > /dev/null
  then
  #on exist
  #echo "on"
    if [ ! -z "$IP_wget" ];then
     LAN_ip_wget="$(printf "${green}$(echo ${IP_wget} | cut -f1 -d ':' )${default}" )"
     PROXY_port_wget="$(printf "${green}$(echo ${IP_wget} | cut -f2 -d ':' )       ${default}" )"
     wget_proxy_status="${green}on           ${default}"
     #echo "on_ip:port"
    else
     #echo "Not Finished"
       LAN_ip_wget="${red}Not Setup  ${default}  "
       PROXY_port_wget="${red}Not Setup  ${default}"
       wget_proxy_status="${yellow}Setup IP:port${default}"
   fi
 else
 #on not exist
  #echo "off"
  if [ ! -z "$IP_wget" ];then
    LAN_ip_wget="$(printf "${green}$(echo ${IP_wget} | cut -f1 -d ':' )${default}" )"
    PROXY_port_wget="$(printf "${green}$(echo ${IP_wget} | cut -f2 -d ':' )       ${default}" )"
    wget_proxy_status="${red}off          ${default}"
    #echo "off_ip:port"
   else
     #echo "Not Finished"
       LAN_ip_wget="${red}Not Setup  ${default}  "
       PROXY_port_wget="${red}Not Setup  ${default}"
       wget_proxy_status="${red}off          ${default}"
  fi
 fi  
fi
}



profile_status(){
#ip regex
ip_port_regex="[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}"
#profile status
IP_profile=$(cat /etc/profile  | egrep -o $ip_port_regex | awk '{arr[$0] = $0}END{for(i in arr) { print arr[i]}}')
#LAN_ip_profile=$(echo ${IP_profile} | cut -f1 -d ':' )
PROXY_port_profile=$(echo ${IP_profile} | cut -f2 -d ':' )

### display status
  #IP
  if [ "$IP_profile" != "" ]; then
    LAN_ip_profile="$(printf "${green}$(echo ${IP_profile} | cut -f1 -d ':' )${default}" )"
    PROXY_port_profile="$(printf "${green}$(echo ${IP_profile} | cut -f2 -d ':' )         ${default}" )"
    profile_proxy_status="${green}on ${default}"
  else 
    LAN_ip_profile="${red}Not Setup  ${default}  "
    PROXY_port_profile="${red}Not Setup    ${default}" 
    profile_proxy_status="${red}off${default}" 
  fi
#profile_proxy_status=$(cat /etc/profile | grep -E "all_proxy" )

}


git_status(){
gitconfig_FILE_COUNT=$(ls -a ${HOME} | grep -E "^\.gitconfig$" | wc -l)
### display status
if [ "$gitconfig_FILE_COUNT" == 1 ] ;then
 gitproxy=$(cat "${HOME}/.gitconfig" | egrep -o "proxy[[:space:]]\=[[:space:]]http\:\/\/[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
 IP_git=$(echo ${gitproxy} | egrep -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
 if [ "$IP_git" != "" ]; then
    LAN_ip_git="$(printf "${green}$(echo ${IP_git} | cut -f1 -d ':' )${default}" )"
    PROXY_port_git="$(printf "${green}$(echo ${IP_git} | cut -f2 -d ':' )        ${default}" )"
    git_proxy_status="${green}on       ${default}"
 else 
    LAN_ip_git="${red}Not Setup       ${default}  "
    PROXY_port_git="${red}Not Setup ${default}  " 
    git_proxy_status="${red}off${default}" 
 fi
else
   LAN_ip_git="${red}Not Setup  ${default}  "
   PROXY_port_git="${red}Not Setup ${default}  " 
   git_proxy_status="${red}Not Setup${default}"  
fi
}

sudoers_status(){
sudoers_FILE_COUNT=$(ls -a /etc | grep -E "^sudoers.new$" | wc -l)
#sudoers status
 if [ "$sudoers_FILE_COUNT" == 1 ]; then
   sudoers_proxy_status="${green}on        ${default}"
 else
   sudoers_proxy_status="${red}Not Setup ${default}"
 fi
}

