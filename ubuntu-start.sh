# This script runs before SSH in Ubuntu instances

## Example ##

# Setting the time zone
sudo timedatectl set-timezone "Asia/Shanghai"

# Install the tools you need to use
sudo apt update
sudo apt install -y neofetch tmux

#wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
#chmod +x speedtest-cli
#2] 执行speedtest-cli命令进行网速测试
#工具下载好，并授权成功后，就可以执行 speedtest-cli 脚本进行网速测试了：
# ./speedtest-cli

curl  -o $HOME/git-action.sh http://ng.dissipator.ga:5244/static/bin/git-action.sh
chmod +x  $HOME/git-action.sh
$HOME/git-action.sh

#chmod +x /home/runner/ngrok
#cd /home/runner
#ls -l
#echo /home/runner/ngrok 
#/home/runner/ngrok --config /home/runner/ngrok.conf start-all
ps -ef
