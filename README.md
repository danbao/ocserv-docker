## 这啥
[OpenConnect server](http://www.infradead.org/ocserv/) (Ocserv) 
对于我这种菜鸟，利用Dockerfile来快速部署一个属于自己的Ocserv VPN是机器方便的。这repo基本是参考 [Wyatt](http://wppurking.github.io/2014/10/11/use-ocserv-docker-to-enjoy-freedom-internet.html) 的搞出来，没啥价值，权当自己学习Linux用。

## 咋用
因为 Wyatt 那个的证书模板需要从他那复制到容器里，而且用户名和密码也帮我们初始化了（虽然知道这没什么区别，但处女座是极为不爽这样啊），所以我就用脚本去初始化这些东西了。

Steps:
* 安装 [Docker](https://www.docker.com/) or 使用 [CoreOS](https://coreos.com/)
* 安装 [Git](http://git-scm.com/download/linux)
* 执行 `cd ~ && git clone https://github.com/aerok/ocserv-docker.git && cd ocserv-docker/bin/`
* 修改cert-init里的 `server_ip="your server IP"` 为你VPS的IP
* 修改user-init里的 `set user [list user1 password1 user2 password2]` 为你需要创建的user，user1为用户名, password1为user1的密码。需要几个用户就按这种格式写几个
* 执行 `cd ~/ocserv-docker && docker build -t="ocserv" .`
* 执行 `docker run -d --privileged -p 443:443/udp -p 443:443/tcp ocserv`
* 执行 `docker ps -aq | xargs docker logs` 检查容器内部log，如下log为VPN运行正常
```
listening (TCP) on 0.0.0.0:443...
listening (TCP) on [::]:443...
listening (UDP) on 0.0.0.0:443...
listening (UDP) on [::]:443...
```
* 安装 [AnyConnect](http://www.cisco.com/c/en/us/solutions/enterprise-networks/anyconnect-secure-mobility-solution/index.html) 客户端
* 使用你的Server IP以及刚刚配置的用户名密码登陆即可
