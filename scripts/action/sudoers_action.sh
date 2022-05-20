#!/bin/bash

sudoers_useproxy(){
sudo cp "/etc/sudoers" "${HOME}/sudoers.new"
if grep -E '^Defaults\s\senv_keep\s\+\=\s\"http_proxy\shttps_proxy\sftp_proxy\srsync_proxy\sno_proxy\"$' "${HOME}/sudoers.new" > /dev/null
    then
  sudoers_proxy_status="${green}on        ${default}"
  echo on
  else
  if grep -E '^#Defaults\s\senv_keep\s\+\=\s\"http_proxy\shttps_proxy\sftp_proxy\srsync_proxy\sno_proxy\"$' "${HOME}/sudoers.new" > /dev/null
  then
   echo "changestatus"
   sudo sed -i 's@#Defaults  env_keep += "http_proxy https_proxy ftp_proxy rsync_proxy no_proxy"@Defaults  env_keep += "http_proxy https_proxy ftp_proxy rsync_proxy no_proxy"@g' "${HOME}/sudoers.new"
   sudo cp "${HOME}/sudoers.new" "/etc/sudoers"
   rm "${HOME}/sudoers.new"
  else
   echo setupon
   sudo sed -i 's@Defaults	env_reset@Defaults	env_reset\nDefaults  env_keep += "http_proxy https_proxy ftp_proxy rsync_proxy no_proxy"@g' "${HOME}/sudoers.new"
   sudo cp "${HOME}/sudoers.new" "/etc/sudoers"
   sudo rm "${HOME}/sudoers.new"
  fi
fi
}

sudoers_stopusingproxy(){
sudo cp "/etc/sudoers" "${HOME}/sudoers.new"
if grep -E '^Defaults\s\senv_keep\s\+\=\s\"http_proxy\shttps_proxy\sftp_proxy\srsync_proxy\sno_proxy\"$' "${HOME}/sudoers.new" > /dev/null
then
  echo "stop"
  sudo sed -i 's@Defaults  env_keep += "http_proxy https_proxy ftp_proxy rsync_proxy no_proxy"@#Defaults  env_keep += "http_proxy https_proxy ftp_proxy rsync_proxy no_proxy"@g' "${HOME}/sudoers.new"
  cp "${HOME}/sudoers.new" "/etc/sudoers"
  rm "${HOME}/sudoers.new"
  else
  echo "error"
fi
}