iptables -p INPUT DROP
iptables -p 
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 25565 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 25565 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -i eth0 -p udp --dport 22 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --dport 25565 -j ACCEPT
iptables -A OUTPUT -i eth0 -p udp --dport 25565 -j ACCEPT
iptables-save
reboot
