#ui total width = 57 chars
top_border(){
  echo -e "/=======================================================\\"
}

bottom_border(){
  echo -e "\=======================================================/"
}

blank_line(){
  echo -e "|                                                       |"
}

hr(){
  echo -e "|-------------------------------------------------------|"
}

options_line(){
  echo -e "|  ${green}Options: ${default}                                            |"
}

quit_footer(){
  hr
  echo -e "|                        ${red}Q) Quit${default}                        |"
  bottom_border
}

back_footer(){
  hr
  echo -e "|                       ${green}B) « Back${default}                       |"
  bottom_border
}

back_help_footer(){
  hr
  echo -e "|         ${green}B) « Back${default}         |        ${yellow}H) Help [?]${default}        |"
  bottom_border
}

print_header(){
  top_border
  echo -e "|     $(title_msg "~~~~~~~~~~~~~ [ ${orange}Orangepi${default} ${cyan}Proxy ] ~~~~~~~~~~~~~${default}")    |"
  echo -e "|     $(title_msg "          Linux  Proxy_in_LAN  Helper        ")     |"
  echo -e "|     $(title_msg "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")     |"
  bottom_border
}

kiauh_update_msg(){
  top_border
  echo -e "|${green}              New KIAUH update available!              ${default}| "
  hr
  echo -e "|${green}  View Changelog: https://git.io/JnmlX                 ${default}| "
  blank_line
  echo -e "|${yellow}  It is recommended to keep KIAUH up to date. Updates  ${default}| "
  echo -e "|${yellow}  usually contain bugfixes, important changes or new   ${default}| "
  echo -e "|${yellow}  features. Please consider updating!                  ${default}| "
  back
}

in_developing(){
  top_border
  echo -e "|${green}                                                      ${default} | "
  echo -e "|${green}              This feature is developing              ${default} | "
  echo -e "|${green}                                                      ${default} | "
  echo -e "|${green}                      Coming soon                     ${default} | "
  echo -e "|${green}                                                      ${default} | "
  back_footer
}

################################################################################
#******************************************************************************#
################################################################################
### TODO: rework other menus to make use of the following functions too and make them more readable

do_action(){
  clear && print_header
  ### $1 is the action the user wants to fire
  $1
  print_msg && clear_msg
  ### $2 is the menu the user usually gets directed back to after an action is completed
  $2
}

deny_action(){
  clear && print_header
  print_unkown_cmd
  print_msg && clear_msg
  $1
}
