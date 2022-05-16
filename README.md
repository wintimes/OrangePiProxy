# OrangepiProxy
A script to set up a local LAN proxy for Orange Pi 
![20220515102500](https://cdn.jsdelivr.net/gh/wintimes/PicGo_Repo_Mellow@main//20220515102500.png)
* 下载
```bash
wget https://raw.githubusercontent.com/wintimes/OrangepiProxy/main/OrangepiProxy.sh
```
* 在win端软件设置好允许局域网代理（按需上网）
* 执行脚本
```bash
sudo bash OrangpiProxy.sh
```
> :warning: 执行一次后，再次更改ip请不要选择更改sudoers 的代理设置。否则会出错

> :warning: 生成了新的ip_proxy 为必要文件，请不要删除
