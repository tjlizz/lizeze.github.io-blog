---
title: linux挂载windows共享文件夹
tags: centos
categories: 操作系统
abbrlink: e04653fd
date: 2021-09-10 20:20:00
---
  创建文件夹
  ```shell
  $ mkdir -p /mnt/share
  ```
 安装依赖
 ```shell
 $ yum install  cifs-utils
 ```
修改/etc/fstab文件，文件最后加入：
``` 
//192.168.16.32/serverapp /mnt/share cifs  defaults  0 0
```
执行命令
```
mount -t cifs -o username='administrator',password='**'  //192.168.16.32/serverapp /mnt/share
```
