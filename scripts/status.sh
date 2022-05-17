wget_status(){
#ip regex
ip_port_regex="[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}:[[:digit:]]{0,9}"
#wget status
IP_wget=$(cat /etc/wgetrc  | egrep -o $ip_port_regex | awk '{arr[$0] = $0}END{for(i in arr) { print arr[i]}}')
LAN_ip_wget=$(echo ${IP_wget} | cut -f1 -d ':' )
PROXY_port_wget=$(echo ${IP_wget} | cut -f2 -d ':' )
wget_proxy_status=$(cat /etc/wgetrc | grep -E "use_proxy = on" | cut -f2 -d '=')

}
