---
title: WSl修改安装位置
abbrlink: '581e4790'
date: 2024-06-26 10:48:55
tags:
---


# WSL修改安装位置

```shell
 wsl --list
 ```

 # 导出分发版为tar文件到d盘

 ``` shell
 wsl --export Ubuntu-20.04 d:\wsl-ubuntu20.04.tar
 ```

 # 注销当前分发版


 ```shell
 wsl --unregister Ubuntu-20.04
 ```

 # 重新导入并安装WSL在d:\wsl-ubuntu20.04

 ```shell
   wsl --import Ubuntu-20.04 d:\wsl-ubuntu20.04 d:\wsl-ubuntu20.04.tar
 ```

# 设置默认登陆用户为安装时用户名

```shell
ubuntu2004 config --default-user Username
```