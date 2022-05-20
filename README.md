# OrangepiProxy
A script to set up a local LAN proxy for Orange Pi
<div align=center>
<img src="https://cdn.jsdelivr.net/gh/wintimes/PicGo_Repo_Mellow@main//20220520115819.png" />
</div> 

* 下载
```bash
git clone https://github.com/wintimes/OrangePiProxy.git
```
* 在其他端代理软件设置好允许局域网代理，以Windows的v2net 为例：
<div align=center>
<img src="https://cdn.jsdelivr.net/gh/wintimes/PicGo_Repo_Mellow@main//20220516080837.png" />
</div>


* 执行脚本
```bash
./OrangePiProxy/OrangpiProxy.sh
```


> :warning: 按需更改sudoers 的代理设置。

> :warning: 生成了新的`ip_proxy` ，`wgetrc.bak` 为必要文件，请不要删除
