#!/bin/bash
git_ui(){
  top_border
  echo -e "|        ${green}~~~~~~~~~~~ [ Proxy in GIT ] ~~~~~~~~~~~${default}       | "
  hr
  options_line
  echo -e "|  1) [IP]                                              | "
  echo -e "|  2) [PORT]                                            | "
  echo -e "|  3) [IP:PORT]                                         | "
  echo -e "|  4) [PROXY]                                           | "
  back_footer
}
git_menu(){
do_action "" "git_ui"
  while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in
      1)
        do_action "change_ip_git" "git_ui";;
      2)
        do_action "change_port_git" "git_ui";;
      3)
        do_action "change_ip_port_git" "git_ui";;
      4)
        do_action "change_proxy_git" "git_ui";;            
    B|b)
        clear; main_menu; break;;
    esac
  done
git_menu
}
