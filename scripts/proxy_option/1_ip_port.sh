#!/bin/bash
proxy_ipport_ui(){
  top_border
  echo -e "|        ${green}~~~~~~~~~~~ [ IP & PORT ] ~~~~~~~~~~~${default}          | "
  hr
  echo -e "|  Options:                                             | "
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
        do_action "klipper_setup_dialog" "install_ui";;
      2)
        do_action "moonraker_setup_dialog" "install_ui";;
      3)
        do_action "install_webui mainsail" "install_ui";;
      4)
        do_action "install_webui fluidd" "install_ui";;            
    B|b)
        clear; main_menu; break;;
      *)
        deny_action "install_ui";;
    esac
  done
proxy_ipport_menu
}
proxy_ipport(){
do_action "" "proxy_status_ui"
proxy_ipport
}