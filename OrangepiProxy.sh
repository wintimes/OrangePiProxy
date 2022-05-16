#!/bin/bash
echo -e "proxy ? [y/n]"
read option_i0
if [[ $option_i0 == "y" ]]; then
    echo -e "1st time to change proxy? [y/n]"
    read option_i4
    if [[ $option_i4 == "y" ]]; then
        echo -e "Do you want change sudoers proxy? [y/n]"
        read option_i1
        if [[ $option_i1 == "y" ]]; then
            #proxy for sudoers
            rm /etc/sudoers.new
            cp /etc/sudoers /etc/sudoers.new
            #vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv DO NOT TOUCH THIS LINE vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv#
            sed -i 's@Defaults	env_reset@Defaults	env_reset \nDefaults  env_keep += "http_proxy https_proxy ftp_proxy rsync_proxy no_proxy"@g' "/etc/sudoers.new"
            #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DO NOT TOUCH THIS LINE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#
            cp /etc/sudoers.new /etc/sudoers
        fi

        echo -e "Enter LAN proxy ip:port such as 192.168.31.31:8118"
        read IP
        echo -e "IP=${IP}" >> '/etc/ip_proxy'
        #get ip_proxy from file ip
        ip_proxy=`sed '/^IP=/!d;s/.*=//' /etc/ip_proxy`

        echo -e "Do you want change profile proxy? [y/n]"
        read option_i2
        if [[ $option_i2 == "y" ]]; then
            #proxy for profile
            chmod 777 '/etc/profile'
            echo -e "export proxy='http://${ip_proxy}'\nexport all_proxy=\$proxy" >> '/etc/profile' 
            chmod 644 '/etc/profile'
        fi
        echo -e "Do you want change wget proxy? [y/n]"
        read option_i3
        if [[ $option_i3 == "y" ]]; then
            #proxy for wget
            chmod 777 '/etc/wgetrc'
            sed -i "s@#https_proxy = http://proxy.yoyodyne.com:18023/@https_proxy = http://${ip_proxy}/@g" "/etc/wgetrc"
            sed -i "s@#http_proxy = http://proxy.yoyodyne.com:18023/@http_proxy = http://${ip_proxy}/@g" "/etc/wgetrc"
            sed -i "s@#ftp_proxy = http://proxy.yoyodyne.com:18023/@ftp_proxy = http://${ip_proxy}/@g" "/etc/wgetrc"
            sed -i "s@#use_proxy = on@use_proxy = on@g" "/etc/wgetrc"
            chmod 644 '/etc/wgetrc'
        fi
    fi
    
    if [[ $option_i4 == "n" ]]; then
    #only change proxy ip
    echo -e 'only change proxy ip?[y/n]'
    read option_i5
    if [[ $option_i5 == "y" ]]; then
        echo -e "Enter LAN proxy ip:port such as 192.168.31.31:8118"
        read ip_proxy_change        
        #get last ip_proxy from file-ip_proxy
        ip_proxy=`sed '/^IP=/!d;s/.*=//' /etc/ip_proxy`
        
        sed -i "s@IP=${ip_proxy}@IP=${ip_proxy_change}@g" "/etc/ip_proxy"
        
        
        echo -e "Do you want change profile proxy? [y/n]"
        read option_i2
        if [[ $option_i2 == "y" ]]; then
            #proxy for profile
            chmod 777 '/etc/profile'
            sed -i "s@export proxy='http://${ip_proxy}@export proxy='http://${ip_proxy_change}@g" "/etc/profile"
            chmod 644 '/etc/profile'
        fi
        
        echo -e "Do you want change wget proxy? [y/n]"
        read option_i3
        if [[ $option_i3 == "y" ]]; then
            #proxy for wget
            chmod 777 '/etc/wgetrc'
            sed -i "s@https_proxy = http://${ip_proxy}/@https_proxy = http://${ip_proxy_change}/@g" "/etc/wgetrc"
            sed -i "s@http_proxy = http://${ip_proxy}/@http_proxy = http://${ip_proxy_change}/@g" "/etc/wgetrc"
            sed -i "s@ftp_proxy = http://${ip_proxy}/@ftp_proxy = http://${ip_proxy_change}/@g" "/etc/wgetrc"
            chmod 644 '/etc/wgetrc'
        fi
        
    fi
    fi
    
fi
