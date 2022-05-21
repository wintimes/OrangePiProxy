#!/bin/bash
proxy_ipport_ui(){
  top_border
  echo -e "|        ${green}~~~~~~~~~~~ [ IP & PORT ] ~~~~~~~~~~~${default}          | "
  hr
  options_line
  echo -e "|  1) [IP]                                              | "
  echo -e "|  2) [PORT]                                            | "
  echo -e "|  3) [IP:PORT]                                         | "
  back_footer
}
proxy_ipport_menu(){
do_action "" "proxy_ipport_ui"
  while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in
      1)
        do_action "change_ip" "proxy_ipport_ui";;
      2)
        do_action "change_port" "proxy_ipport_ui";;
      3)
        do_action "change_ip_port" "proxy_ipport_ui";;       
    B|b)
        clear; main_menu; break;;
    esac
  done
proxy_ipport_menu
}
change_ip_port_ui(){
  top_border
  echo -e "|        ${green}~~~~~~~~~~~ [ IP & PORT ] ~~~~~~~~~~~${default}          | "
  echo -e "|${green}~~~~~~ Enter ip&port like this 192.168.31.31:8188 ~~~~~${default}| "
}
change_ip_port(){
change_ip_port_ui
echo "changefinished"
    read -p "${cyan}Perform action:${default} " action; echo
    ip_proxy=$action

} 