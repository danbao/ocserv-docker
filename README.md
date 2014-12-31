## 这啥
相信即使给我一个完整的部署 [OpenConnect server](http://www.infradead.org/ocserv/) 的教程，即使看懂了，面对不同环境下可能出现的问题，我还是会相当头疼的。所以对于我这种菜鸟，利用Docker来快速部署VPN就显得容易多了。这repo大部分是参考 [Wyatt](http://wppurking.github.io/2014/10/11/use-ocserv-docker-to-enjoy-freedom-internet.html) 的，所以没啥价值，权当自己学习Linux用。

## 咋用
因为 Wyatt 那个的证书模板需要从他那复制到容器里，而且用户名和密码也帮我们初始化了（虽然知道这没什么区别，但处女座是极为不爽这样啊），所以我就用脚本去初始化这些东西了。

Steps:
* 安装 [Docker](https://www.docker.com/) 和 [Git](http://git-scm.com/download/linux) or 直接使用 [CoreOS](https://coreos.com/)
* 执行 `cd ~ && git clone https://github.com/aerok/ocserv-docker.git && cd ocserv-docker && chmod +x Install`
* 执行 `./Install` 按提示添加Server IP和VPN账号，约5分钟后，梯子就搭好了
* 执行 `docker ps -aq | xargs docker logs` 检查容器内部log，如下log显示VPN运行正常
```
listening (TCP) on 0.0.0.0:443...
listening (TCP) on [::]:443...
listening (UDP) on 0.0.0.0:443...
listening (UDP) on [::]:443...
```

## Info
* Box Size: 483.8 MB
* 基础 Box: ubuntu:latest   (192.7 MB)
* 测试过的环境: 
  * [Vultr 768MB CoreOS Stable]
  * [DigitalOcean 512MB CoreOS 522.2.0 (alpha)]

## Refs
* [openSSL命令、PKI、CA、SSL证书原理](http://www.cnblogs.com/littlehann/p/3738141.html)
* [折腾笔记：架设OpenConnect Server给iPhone提供更顺畅的网络生活](http://bitinn.net/11084/)
* [expect实现交互初步](http://blog.ihipop.info/2010/12/1949.html)
* [foreach](http://wiki.tcl.tk/1018)
* [Docker 2 -- 关于Dockerfile](http://blog.tankywoo.com/docker/2014/05/08/docker-2-dockerfile.html)
* [iOS AnyConnect配置](http://www.brucebot.com/2014/11/how-to-setup-a-anyconnect-vpn-for-ios-with-certificate/)
* [Shell编程极简入门实践](https://github.com/StevenSLXie/Tutorials-for-Web-Developers/blob/master/Shell%E7%BC%96%E7%A8%8B%E6%9E%81%E7%AE%80%E5%85%A5%E9%97%A8%E5%AE%9E%E8%B7%B5.md)
* [BASH快速入门手册](https://laoyur.com/?p=638#function)
* [sed 简明教程](http://coolshell.cn/articles/9104.html)
