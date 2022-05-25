---
title: 在Linux中搜索最近修改的文件
tags: linux
categories: 操作系统
abbrlink: 40c667fc
date: 2022-05-25 11:00:21
---
# 指定时间内修改的文件


## 在十分钟内修改的

 搜索当前目录中 10 分钟内修改的所有文件

 ```shell
 $ find . -type f -mmin -10 
 ```
 ##  一天之内修改的文件
  搜索当前目录中一天内修改的所有文件

 ```shell
 $ find . -type f -mtime -1 
 ```
 # 指定时间之前修改的文件
 ##  十分钟之前修改的文件 

 ```shell
 $ find . -type f -mmin +10 
 ```

 ## 1天之前修改的文件

 ```shell
 $ find . -type f -mtime +1 
 ```