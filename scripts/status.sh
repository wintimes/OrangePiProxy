wget_status(){
#ip regex
ip_port_regex="[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}"
#wget status
IP_wget=$(cat /etc/wgetrc  | egrep -o $ip_port_regex | awk '{arr[$0] = $0}END{for(i in arr) { print arr[i]}}')
### display status
  #IP
  if [ "$IP_wget" != "" ]; then
    LAN_ip_wget="$(printf "${green}$(echo ${IP_wget} | cut -f1 -d ':' )${default}" )"
    PROXY_port_wget="$(printf "${green}$(echo ${IP_wget} | cut -f2 -d ':' )       ${default}" )"
    wget_proxy_status="$(printf "${green}$(cat /etc/wgetrc | grep -E "use_proxy = on" | cut -f2 -d '=')${default}" )"
  else 
    LAN_ip_wget="${red}Not Setup!      ${default}  "
    PROXY_port_wget="${red}Not Setup!${default}  " 
    wget_proxy_status="${red}Not Setup!${default}  "  
  fi

#LAN_ip_wget=$(echo ${IP_wget} | cut -f1 -d ':' )
#PROXY_port_wget=$(echo ${IP_wget} | cut -f2 -d ':' )
#wget_proxy_status=$(cat /etc/wgetrc | grep -E "use_proxy = on" | cut -f2 -d '=')
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
    profile_proxy_status="${green}on${default}"
  else 
    LAN_ip_profile="${red}Not Setup!      ${default}  "
    PROXY_port_profile="${red}Not Setup!${default}  "  
  fi
#profile_proxy_status=$(cat /etc/profile | grep -E "all_proxy" )

}

git_status(){
#ip regex
ip_port_regex="[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}"
#git status
IP_git=$(cat ${HOME}/.gitconfig  | egrep -o $ip_port_regex | awk '{arr[$0] = $0}END{for(i in arr) { print arr[i]}}')
#LAN_ip_git=$(echo ${IP_git} | cut -f1 -d ':' )
#PROXY_port_git=$(echo ${IP_git} | cut -f2 -d ':' )

### display status
  #IP
  if [ "$IP_git" != "" ]; then
    LAN_ip_git="$(printf "${green}$(echo ${IP_git} | cut -f1 -d ':' )${default}" )"
    PROXY_port_git="$(printf "${green}$(echo ${IP_git} | cut -f2 -d ':' )${default}" )"
    git_proxy_status="${green} on${default}"
  else 
    LAN_ip_git="${red}Not Setup!      ${default}  "
    PROXY_port_git="${red}Not Setup!${default}  "   
  fi
#git_proxy_status=$(cat ${HOME}/.gitconfig | grep -E "proxy" )

}

sudoers_status(){
#sudoers status
 if [ -f "/etc/sudoers.new" ]; then
   sudoers_proxy_status="${green} on${default}"
 else
   sudoers_proxy_status="${red}Not Setup!${default}"
 fi
}