## 安装
1. `cd ~;git clone git@github.com:lihao2333/rcClub.git`
2. 在~/.bashrc最后添加`source ~/rcClub/main.bashrc`
3. `sh ./update.sh`
4. `source ~/.bashrc`
5. 在~/.vimrc最后添加`source ~/rcClub/main.vimrc`
6. `cp vps_demo.txt vps.txt`并且在vps.txt中管理自己的远程服务器用户名密码等信息. 改好后执行vps试下

## 使用
命令|功能
---|---
v|vim
c|cd
ser_http|本地开启http 8000端口并且显示ip
up|cd ..
up 2| cd ../..
up 3| cd ../../..
bx|在/tmp中创建一个临时文件夹
pylog xxx.py |后台执行xxx.py 并且将log输出为py.log
vps|查看远程自己所有的主机
vps 1| 登录vps列表中的第一项
