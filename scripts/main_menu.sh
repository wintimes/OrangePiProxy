main_ui(){
  print_header
  top_border
  echo -e "|   $(title_msg "~~~~~~~~~~~~~~~ [ Custom Proxy ] ~~~~~~~~~~~~~~~")    |"
  hr
  options_line
  echo -e "|  0) [ Proxy Status ]                                  |"
  echo -e "|  1) [ IP & PORT ]                                     |"
  hr
  echo -e "|  2) [ Profile ]               |  Status: $profile_proxy_status           |"
  echo -e "|  3) [ Wget ]                  |  Status:$wget_proxy_status          |"
  echo -e "|  4) [ Git ]                   |  Status:$git_proxy_status           |"
  echo -e "|  5) [ Sudoers ]               |  Status:$sudoers_proxy_status           |"
  hr
  echo -e "|  6) [ All in one ]                                    |"
  quit_footer
}


main_menu(){

  #status
  wget_status
  profile_status
  git_status
  sudoers_status
  
  print_msg && clear_msg
  main_ui
  while true; do
    read -p "${cyan}Perform action:${default} " action; echo
    case "$action" in
      0) clear && proxy_status_menu && break;;
      
      1) clear && proxy_ipport_menu && break;;
      2) clear && profile_menu && break;;
      3) clear && wget_menu && break;;
      4) clear && git_menu && break;;
      5) clear && sudoers_menu && break;;

      6) clear && allinone_menu && break;;
      Q|q)
        echo -e "${green}############ Happy Surfing! ############${default}"; echo
        exit -1;;
      *)
        deny_action "main_ui";;
    esac
  done
  clear; main_menu
}
