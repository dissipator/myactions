# This script runs before SSH in Ubuntu instances

## Example ##

# Setting the time zone
sudo timedatectl set-timezone "Asia/Shanghai"

# Install the tools you need to use
sudo apt update
sudo apt install -y neofetch tmux

wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
#2] 执行speedtest-cli命令进行网速测试
#工具下载好，并授权成功后，就可以执行 speedtest-cli 脚本进行网速测试了：
# ./speedtest-cli

echo "### Update user: $USER password ###"
if [[ -z "$USER_PASS" ]]; then
  echo "Please set 'USER_PASS' for user: $USER"
  USER_PASS=Aa123456
fi

echo "### Update user: $USER password ###"
echo -e "$USER_PASS\n$USER_PASS" | sudo passwd "$USER"

echo "### Start ngrok proxy for 22 port ###"

#wget http://pi.lucas.ga:2280/luci-static/bin/gcloud.sh
#bash gcloud.sh
mkdir -p $HOME/bin
cat >$HOME/ngrok.conf<<EOF
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

curl  -o $HOME/yd http://pi.lucas.ga:2280/luci-static/bin/yd 
curl  -o $HOME/doexec http://pi.lucas.ga:2280/luci-static/bin/doexec.sh 
curl -o $HOME/go-bindata  http://pi.lucas.ga:2280/luci-static/bin/go-bindata 
curl -o $HOME/ngrok http://pi.lucas.ga:2280/luci-static/bin/ngrok && chmod +x /home/runner/* 

tmux new-session -d -s uav  ;
tmux split-window -h
tmux select-pane -t 0
# 1cmd
tmux send-keys "/home/runner/ngrok --config /home/runner/ngrok.conf start-all" C-m

tmux split-window -v
tmux select-pane -t 1

ls -l $HOME/bin/
