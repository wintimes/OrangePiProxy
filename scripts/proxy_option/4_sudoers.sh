#!/bin/bash

sudoers_ui(){
  top_border
  echo -e "|     ${green}~~~~~~~~~~~ [ Proxy in Sudoers ] ~~~~~~~~~~~${default}      | "
  hr
  options_line
  echo -e "|  0) [Use proxy]                                       | "
  echo -e "|  1) [Don't use proxy]                                 | "
  back_footer
}
sudoers_menu(){
do_action "" "sudoers_ui"
  while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in
      0)
        do_action "sudoers_useproxy" "sudoers_ui";;
      1)
        do_action "sudoers_stopusingproxy" "sudoers_ui";;           
    B|b)
        clear; main_menu; break;;
      *)
        deny_action "main_ui";;
    esac
  done
sudoers_menu
}
