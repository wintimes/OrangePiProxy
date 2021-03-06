#!/bin/bash
proxy_status_ui(){
  top_border
  echo -e "|         ${green}~~~~~~~~~~~ [ STATUS ] ~~~~~~~~~~~${default}            | "
  hr
  echo -e "|  1)  Profile[ global ]    |  IP:    ${LAN_ip_profile} ${profile_blank_ip_length}|"
  echo -e "|                           |  PORT:  ${PROXY_port_profile}${profile_blank_port_length}|" 
  echo -e "|                           |  PROXY: $profile_proxy_status               |"
  echo -e "|                           |                           |"
  echo -e "|  2)  Wget                 |  IP:    ${LAN_ip_wget}${wget_blank_ip_length}|"
  echo -e "|                           |  PORT:  ${PROXY_port_wget}${wget_blank_port_length}|"
  echo -e "|                           |  PROXY: $wget_proxy_status     |"
  echo -e "|                           |                           |"
  echo -e "|  3)  Git                  |  IP:    ${LAN_ip_git} ${git_blank_ip_length}|"
  echo -e "|                           |  PORT:  ${PROXY_port_git}${git_blank_port_length}|"
  echo -e "|                           |  PROXY: $git_proxy_status         |"
  echo -e "|                           |                           |"
  echo -e "|  4)  Sudoers ${yellow}[CAUTION]${default}    |  PROXY: $sudoers_proxy_status        |"
  echo -e "|                           |                           |" 
  echo -e "|                           |                           |" 
  echo -e "|                           |                           |"   
  echo -e "|                           |                           |"   
  echo -e "|                           |                           |"   
  back_footer
}
proxy_status_menu(){
 wget_status
 do_action "" "proxy_status_ui"
  while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in          
    B|b)
        clear; main_menu; break;;
    esac
  done
proxy_status_menu
}
