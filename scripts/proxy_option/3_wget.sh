#!/bin/bash

wget_ui(){
  top_border
  echo -e "|       ${green}~~~~~~~~~~~ [ Proxy in wget ] ~~~~~~~~~~~${default}       | "
  hr
  options_line
  echo -e "|  0) [use_proxy]                                       | "
  echo -e "|  1) [all_proxy]                                       | "
  echo -e "|  Special:                                             | "  
  echo -e "|  2) [http_proxy]                                      | "
  echo -e "|  3) [https_proxy]                                     | "
  echo -e "|  4) [ftp_proxy]                                       | "

  back_footer
}
wget_menu(){
do_action "" "wget_ui"
  while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in
      1)
        do_action "" "wget_ui";;
      2)
        do_action "" "wget_ui";;
      3)
        do_action "" "wget_ui";;
      4)
        do_action "" "main_ui";;            
    B|b)
        clear; main_menu; break;;
      *)
        deny_action "install_ui";;
    esac
  done
wget_menu
}
