#!/bin/bash

profile_ui(){
  top_border
  echo -e "|     ${green}~~~~~~~~~~~ [ Proxy in Profile ] ~~~~~~~~~~~${default}     | "
  hr
  echo -e "|  Options:                                            | "
  echo -e "|  1) [http_proxy]                                      | "
  echo -e "|  2) [https_proxy]                                     | "
  echo -e "|  3) [ftp_proxy]                                       | "
  echo -e "|  4) [all_proxy]                                       | "
  back_footer
}
profile_menu(){
do_action "" "profile_ui"
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
profile_menu
}
profile(){
do_action "" "profile_ui"
profile
}