---
title: linux删除指定时间的文件
tags: linux
abbrlink: 9c9397cb
date: 2022-05-11 10:56:04
---


#  删除超过30天的文件

 可以使用`find`命令搜索修改时间早于30天的文件

 ```shell
 $ find /tmp -type  f -mtime +30
 ```
验证一下搜索结果是否正确，避免误删文件。确认无误后，执行以下命令删除

```shell
$ find /tmp -type f -mtime +30 -delete 
```

# 删除指定类型文件


除了删除所有文件之外，还可以添加更多筛选器来查找命令。例如，只需要删除扩展名为“.log”并在30天之前修改的文件。

为了安全起见，首先进行试运行并列出符合条件的文件。

```shell 
  $ find /var/log -name "*.log" -type f -mtime +30 
```
 验证数据无误后，执行以下命令删除

 ```shell
 $ find /var/log -name "*.log" -type f -mtime +30 -delete 
 ```

 # 删除目录

 以下命令将搜索 /var/log 目录下 90 天之前修改过的所有目录。
 ```shell 
 $ find /var/log -type d -mtime +90 
 ```
 我们可以使用命令行选项执行 `rm` 命令。查找命令输出将作为输入发送到 `rm` 命令。`-exec`
 
 ```shell
 $ find /var/log -type d -mtime +30 -exec rm -rf {} \; 
 ```
 > 在删除目录之前，请确保没有删除任何有用的目录。有时，父目录修改日期可能早于子目录。在这种情况下，递归删除也可以删除子目录。