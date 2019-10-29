#!/bin/bash
clear
echo 获取本机IP地址
IP=$(curl -ks ip.sb)
echo 本机IP地址为 $IP
echo 开始进行IP TCP检测
test=$(curl -ks https://cn-dycm-tcping.torch.bgp.sh:10001/$IP/22)
if [[ ${test} =~ "true" ]];then
echo -e "\033[32m端口正常\033[0m" 
elif [[ ${test} =~ "null" ]];then
echo -e "\033[31m端口不通\033[0m" 
echo -e 进行更换IP操作
bash aws_ip.sh 2
fi

echo -e 检测结束
