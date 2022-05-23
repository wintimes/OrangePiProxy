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
     #blank
##ip
     lan_ip_length=$(echo "$LAN_ip_wget" | awk '{print length($0)}')
     #echo $lan_ip_length
     wget_blank_length=`expr 28 - ${lan_ip_length}`
     #echo "wget_blank_length is $wget_blank_length"
     wget_blank_ip_length=""
     for ((i = 1; i <= $wget_blank_length; i++))
      do
      #echo $i
      wget_blank_ip_length="${wget_blank_ip_length}"" "
     done
     #echo "$wget_blank_ip_length" | awk '{print length($0)}'
     #echo "lan_ip_length is $lan_ip_length"
     #echo -e "|  2)  Wget                 |  IP:    ${LAN_ip_wget} ${wget_blank_ip_length}|"
     #echo "$wget_blank_ip_length""1"
     #echo "on_ip:port"
##port
     wget_PROXY_port_length=$(echo "$PROXY_port_wget" | awk '{print length($0)}')
     #echo $lan_ip_length
     port_wget_blank_length=`expr 28 - ${wget_PROXY_port_length}`
     #echo "profile_blank_length is $profile_blank_length"
     wget_blank_port_length=""
     for ((i = 1; i <= $port_wget_blank_length; i++))
      do
      #echo $i
      wget_blank_port_length="${wget_blank_port_length}"" "
     done
     #echo -e "|                           |  PORT:  ${PROXY_port_wget}${wget_blank_port_length}|"
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
     ###blank###
###ip
     profile_lan_ip_length=$(echo "$LAN_ip_profile" | awk '{print length($0)}')
     #echo $lan_ip_length
     profile_blank_length=`expr 27 - ${profile_lan_ip_length}`
     #echo "profile_blank_length is $profile_blank_length"
     profile_blank_ip_length=""
     for ((i = 1; i <= $profile_blank_length; i++))
      do
      #echo $i
      profile_blank_ip_length="${profile_blank_ip_length}"" "
     done
     #echo "$profile_blank_ip_length" | awk '{print length($0)}'
     #echo "lan_ip_length is $lan_ip_length"
     #echo -e "|  1)  Profile[ global ]    |  IP:    ${LAN_ip_profile} ${profile_blank_ip_length}|"
     #echo "$profile_blank_ip_length""1"   
###port 
     profile_PROXY_port_length=$(echo "$PROXY_port_profile" | awk '{print length($0)}')
     #echo $lan_ip_length
     port_profile_blank_length=`expr 28 - ${profile_PROXY_port_length}`
     #echo "profile_blank_length is $profile_blank_length"
     profile_blank_port_length=""
     for ((i = 1; i <= $port_profile_blank_length; i++))
      do
      #echo $i
      profile_blank_port_length="${profile_blank_port_length}"" "
     done
     #echo -e "|                           |  PORT:  ${PROXY_port_profile}${profile_blank_port_length}|"
  else 
    LAN_ip_profile="${red}Not Setup  ${default}  "
    PROXY_port_profile="${red}Not Setup    ${default}" 
    profile_proxy_status="${red}off${default}" 
  fi
#profile_proxy_status=$(cat /etc/profile | grep -E "all_proxy" )
}


git_status(){
gitconfigDir=$( find /home -name ".gitconfig" )
if [  -f "$gitconfigDir" ];then
 #echo ".gitconfig  exist"
if grep -E "proxy" "$gitconfigDir" > /dev/null
then 
#echo alreadyproxy
 gitproxy=$(cat "$gitconfigDir" | egrep -o "proxy[[:space:]]\=[[:space:]]http\:\/\/[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
 IP_git=$(echo ${gitproxy} | egrep -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}")
 if [ "$IP_git" != "" ]; then
    LAN_ip_git="$(printf "${green}$(echo ${IP_git} | cut -f1 -d ':' )${default}" )"
    PROXY_port_git="$(printf "${green}$(echo ${IP_git} | cut -f2 -d ':' )        ${default}" )"
    git_proxy_status="${green}on       ${default}"
     ###blank###
###ip
     git_lan_ip_length=$(echo "$LAN_ip_git" | awk '{print length($0)}')
     #echo $lan_ip_length
     git_blank_length=`expr 27 - ${git_lan_ip_length}`
     #echo "git_blank_length is $git_blank_length"
     git_blank_ip_length=""
     for ((i = 1; i <= $git_blank_length; i++))
      do
      #echo $i
      git_blank_ip_length="${git_blank_ip_length}"" "
     done
     #echo "$git_blank_ip_length" | awk '{print length($0)}'
     #echo "lan_ip_length is $lan_ip_length"
     #echo -e "|  3)  Git                  |  IP:    ${LAN_ip_git} ${git_blank_ip_length}|"
     #echo "$git_blank_ip_length""1"   
###port 
     git_PROXY_port_length=$(echo "$PROXY_port_git" | awk '{print length($0)}')
     #echo $lan_ip_length
     port_git_blank_length=`expr 28 - ${git_PROXY_port_length}`
     #echo "git_blank_length is $git_blank_length"
     git_blank_port_length=""
     for ((i = 1; i <= $port_git_blank_length; i++))
      do
      #echo $i
      git_blank_port_length="${git_blank_port_length}"" "
     done
     #echo -e "|                           |  PORT:  ${PROXY_port_git}${git_blank_port_length}|"       
 else 
    LAN_ip_git="${red}Not Setup       ${default}  "
    PROXY_port_git="${red}Not Setup ${default}  " 
    git_proxy_status="${red}off${default}" 
 fi
else
#echo noproxy
   LAN_ip_git="${red}Not Setup  ${default}      "
   PROXY_port_git="${red}Not Setup ${default}        " 
   git_proxy_status="${red}Not Setup${default}"  
fi
else
   LAN_ip_git="${red}Not Setup  ${default}      "
   PROXY_port_git="${red}Not Setup ${default}        " 
   git_proxy_status="${red}Not Setup${default}"  
fi
}

sudoers_status(){
sudo cp "/etc/sudoers" "${HOME}/sudoers.new"
sudo chmod 777 "${HOME}/sudoers.new"
if grep -E '^Defaults\s\senv_keep\s\+\=\s\"http_proxy\shttps_proxy\sftp_proxy\srsync_proxy\sno_proxy\"$' "${HOME}/sudoers.new" > /dev/null
then 
#echo on
  sudoers_proxy_status="${green}on        ${default}"
else 
#echo off
  sudoers_proxy_status="${red}Not Setup ${default}"
fi
sudo rm "${HOME}/sudoers.new"
}

