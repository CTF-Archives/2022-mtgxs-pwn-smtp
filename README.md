# 2022 美团高校赛 smtp

> 你知道SMTP协议吗？

本项目使用动态flag，请使用`$FLAG`环境变量传入flag数据（如`CTFd`），题目环境位于`9999`端口

docker镜像发布于DockerHub：`randark/2022-mtgxs-pwn-smtp:master`

源码储存于Github：https://github.com/CTF-Archives/2022-mtgxs-pwn-smtp

**以下为题目当时的readme**

## 运行方式 How to run

```bash
$ ./pwn [port]
```

默认端口：9999

The default port：9999

## 交互  interaction

和pwn的监听端口（默认9999）交互而不是和pwn程序本身。

Interact with the listening port of pwn (default 9999) instead of with the pwn program itself.

## 其他问题 Other issues

本地和docker运行结果有差异的以docker为准。

If there is a difference between the local and docker running results, the docker shall prevail.