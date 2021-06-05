#启用BBR
bbr() {
	
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
        echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
	sysctl -p
	lsmod | grep bbr
	echo "BBR启动"
  
}



#安装nginx
nginx() {
   
   sudo apt update
    sudo apt install nginx

   
}



#中继转发
transfer() {

wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/brook-pf.sh && chmod +x brook-pf.sh && bash brook-pf.sh


}

#菜单 
menu() {
	net_congestion_control=`cat /proc/sys/net/ipv4/tcp_congestion_control | awk '{print $1}'`
	net_qdisc=`cat /proc/sys/net/core/default_qdisc | awk '{print $1}'`
	echo "=============================================================="
	echo "1.启动BBR"
	echo "当前拥塞控制算法为: ${net_congestion_control} 当前队列算法为: ${net_qdisc} "
	echo ""
	echo "2.安装shadowsocksR"
	echo ""
	echo "3.安装brook中转"
	echo ""
	echo "4.安装nginx伪装网站"	
	echo ""
	echo "5.卸载nginx"
	echo "=============================================================="

	
	read -p " 请输入数字 :" num
        case "$num" in
	        1)
		bbr
		;;
		2)
		ssr
		;;
		3)
		transfer
		;;
		4)
		nginx
		;;
	esac
}

menu
