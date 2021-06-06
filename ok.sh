#!/usr/bin/env bash



#启用BBR
bbrok(){
        echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
        echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
	sysctl -p
	lsmod | grep bbr
	echo "BBR启动"  
}



#安装nginx
nginxok(){
    sudo apt update
    sudo apt install nginx  
}

#ssr
ssrok(){
    wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

}

#中继转发
transferok(){
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/brook-pf.sh && chmod +x brook-pf.sh && bash brook-pf.sh
}

#菜单 
menu(){
        clear
        net_congestion_control=`cat /proc/sys/net/ipv4/tcp_congestion_control | awk '{print $1}'`
	net_qdisc=`cat /proc/sys/net/core/default_qdisc | awk '{print $1}'`
	echo "==========================OK一键脚本=========================="
	echo "============================================================="
	echo "1.启动BBR"
	echo "当前拥塞控制算法为: ${net_congestion_control} 当前队列算法为: ${net_qdisc} "
	echo "---"
	echo "2.安装shadowsocksR"
	echo "---"
	echo "3.安装brook中转"
	echo "---"
	echo "4.安装nginx伪装网站"	
	echo "---"
	echo "5.卸载nginx"
	echo "============================================================="
	read -r -p "请选择:" num
	case ${num} in
	1)
	bbrok
	;;
	2)
	ssrok
	;;
	3)
	transferok
	;;
	4)
	nginxok
	;;
esac
}
menu
