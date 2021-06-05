#启用BBR
startbbr(){
	
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
  echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
	sysctl -p
	echo "BBR启动"
  lsmod | grep bbr

  
菜单 
menu() {
	
	echo "1.启动BBR"
	
	
	read -r -p "请选择:" selectInstallType
	case ${selectInstallType} in
	1)
		startbbr
		;;
		esac
}

menu
