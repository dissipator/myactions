# This script runs before SSH in Ubuntu instances

## Example ##

# Setting the time zone
sudo timedatectl set-timezone "Asia/Shanghai"

# Install the tools you need to use
sudo apt update
sudo apt install -y neofetch

wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
#2] 执行speedtest-cli命令进行网速测试
#工具下载好，并授权成功后，就可以执行 speedtest-cli 脚本进行网速测试了：
# ./speedtest-cli

#wget http://pi.lucas.ga:2280/luci-static/bin/gcloud.sh
#bash gcloud.sh

cat >./ngrok.conf<<EOF
server_addr: "ng.dissipator.ga:4443"
trust_host_root_certs: false
tunnels:
  ssh:
    proto:
      tcp: "127.0.0.1:22"
    remote_port: 2227
  web:
    proto:
      http: 8888
    subdomain: w
EOF

sudo apt install -y neofetch python3 python3-pip
pip3 install webssh
rm -rf $HOME/bin/yd $HOME/bin/doexec.sh
curl  -o $HOME/bin/yd http://pi.lucas.ga:2280/luci-static/bin/yd && sudo chmod +x $HOME/bin/yd
curl  -o $HOME/bin/doexec http://pi.lucas.ga:2280/luci-static/bin/doexec.sh && sudo chmod +x $HOME/bin/doexec.sh
cd ${HOME} && pwd && ls -l 
wssh &
sudo wget http://pi.lucas.ga:2280/luci-static/bin/go-bindata 
sudo wget http://pi.lucas.ga:2280/luci-static/bin/ngrok && chmod +x ngrok && ./ngrok --config=./ngrok.conf start-all &
netstat -lntp 
#/content/bin/yd https://youtu.be/LWgGnZ9BdrU
