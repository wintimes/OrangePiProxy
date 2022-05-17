#!/bin/bash
proxy_status_ui(){
  top_border
  echo -e "|        ${green}~~~~~~~~~~~ [ STATUS ] ~~~~~~~~~~~${default}             | "
  hr
  echo -e "|  1)  IP:$LAN_ip_wget                                 | "
  echo -e "|  2)  PORT:$PROXY_port_wget                                        | "
  echo -e "|  3)  PROXY:$wget_proxy_status                                        | "
  back_footer
}
proxy_status_menu(){
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
