---
title: linux防火墙基本操作
tags: linux
categories: 操作系统
abbrlink: 307bc4b4
date: 2021-09-12 12:33:55
---

# 启动防火墙
```
systemctl start firewalld
```
# 禁用防火墙
```
systemctl stop firewalld
```
# 设置开机启动

```
systemctl enable firewalld
```
# 停止并禁用开机启动

```
sytemctl disable firewalld
```
# 重启防火墙

 ```
firewall-cmd --reload
```
# 查看状态
```
systemctl status firewalld或者 firewall-cmd --state
```
# 查看版本
```
firewall-cmd --version
```

#  查看开放的端口
```
firewall-cmd --list-port

```

 # 开放端口

```shell
firewall-cmd --zone=public --add-port=80/tcp --permanent
#不加 --permanent重启之后就会失效，加了是永久生效
# 增加规则之后要重启防火墙
firewall-cmd --reload
```
