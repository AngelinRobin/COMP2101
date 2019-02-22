#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
# this version is specifically allowed to hardcode an interface name even though it is bad practice
#
# Sample output:
#   Hostname      : zubu
#   LAN Address   : 192.168.2.2
#   LAN Name      : net2-linux
#   External IP   : 1.2.3.4
#   External Name : some.name.from.our.isp


# the LAN info uses a hardcoded interface name of "ens33"
#    - change ens33 to whatever interface you have and want to gather info about


# TASK 1: Create a list of interface names and use a for loop to generate the report for every interface


for interface in $(ifconfig | cut -d ' ' -f1| tr ':' '\n' | awk NF)
do
################
# Data Gathering
################
# grep is used to filter ip command output so we don't have extra junk in our output
# stream editing with sed and awk are used to extract only the data we want displayed
# we use the hostname command to get our system name
my_hostname=$(hostname)


# the LAN name is looked up using the LAN address in case it is different from the system name
# the lan address is pulled out of the ip address command output
# we are assuming there is only one IPV4 address assigned to this interface
interface_ipv4_address=$(ip a s $interface|awk -F '[/ ]+' '/inet /{print $3}')
interface_ipv4_hostname=$(getent hosts $interface_ipv4_address | awk '{print $2}')


# the default route can be found in the route table normally
# the router name is obtained with getent
default_router_address=$(ip r s default| cut -d ' ' -f 3)
default_router_name=$(getent hosts $default_router_address|awk '{print $2}')


# the network address can be easily pulled from the route table with the ip route list command
# the network name can be looked up with the getent command
interface_network_address=$(ip route list dev $interface scope link|cut -d ' ' -f 1|sed -n 2p)
interface_network_number=$(cut -d / -f 1 <<<"$interface_network_address")
interface_network_name=$(getent networks $interface_network_number|head -n 1|awk '{print $1}')


# finding external information relies on curl being installed and relies on live internet connection
external_address=$(curl -s icanhazip.com|awk '{print $1}')
external_name=$(getent hosts $external_address |awk '{print $2}')




echo "
System Identification Summary ($interface)
-----------------------------
Hostname      : $my_hostname
Default Router: $default_router_address
Router Name   : $default_router_name
External IP   : $external_address
External Name : $external_name
Interface Address         : $interface_ipv4_address
Interface Name            : $interface_ipv4_hostname
Interface Network Address : $interface_network_address
Interface Network Name    : $interface_network_name
"
done
