# jul/03/2024 20:32:14 by RouterOS 7.6
# software id = 
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.26.20.130-172.26.20.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether2 name=dhcp1
/port
set 0 name=serial0
set 1 name=serial1
/ip address
add address=172.26.20.129/25 interface=ether2 network=172.26.20.128
add address=192.168.20.2/30 interface=ether3 network=192.168.20.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=172.26.20.128/25 gateway=172.26.20.129
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add disabled=no dst-address=172.26.20.0/25 gateway=192.168.20.1 \
    routing-table=main suppress-hw-offload=no
