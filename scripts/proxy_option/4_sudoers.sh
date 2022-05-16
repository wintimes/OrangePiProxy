#!/bin/bash

sudoers_ui(){
  top_border
  echo -e "|     ${green}~~~~~~~~~~~ [ Proxy in SUDO ] ~~~~~~~~~~~${default}        | "
  hr
  echo -e "|  Options:                                             | "
  echo -e "|  0) [Use proxy]                                       | "
  echo -e "|  1) [Don't use proxy]                                 | "
  back_footer
}
sudoers_menu(){
do_action "" "sudoers_ui"
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
sudoers_menu
}
sudoers(){
do_action "" "sudoers_ui"
sudoers
}