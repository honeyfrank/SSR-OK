#启用BBR
startbbr() {
	
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
  echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
	sysctl -p
	echo "BBR启动"
  lsmod | grep bbr
}
  
#菜单 
menu() {
	
	echo "1.启动BBR"
	echo " 当前拥塞控制算法为: ${net_congestion_control} 当前队列算法为: ${net_qdisc} "
	
	
	read -p " 请输入数字 :" num
        case "$num" in
	1)
		startbbr
		;;
	esac
}

menu
