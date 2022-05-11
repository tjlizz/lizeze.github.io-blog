---
title: linux根据时间清理文件
tags: linux
abbrlink: 9c9397cb
date: 2022-05-11 10:56:04
---

需要根据时间删除这个目录下的文件，/tmp，清理掉20天之前的无效数据。

可以使用下面一条命令去完成：

```shell
find /tmp -mtime +21 -name "*.*" -exec rm -Rf {} \;

```
这个是根据时间删除。

下面简要解释一下，这句shell命令：

find /home/lifeccp/dicom/studies -mtime +21 -name "*.*" -exec rm -Rf {} \;

* /home/lifeccp/dicom/studies ：准备要进行清理的任意目录
* -mtime：标准语句写法
* ＋10：查找10天前的文件，这里用数字代表天数，＋30表示查找30天前的文件
* "*.*"：希望查找的数据类型，"*.jpg"表示查找扩展名为jpg的所有文件，"*"表示查找所有文件
* -exec：固定写法
* rm -rf：强制删除文件，包括目录
*  {} \; ：固定写法，一对大括号+空格+/+;

当然也可以根据文件名、根据大小，根据其他不同条件过滤删除，或者修改等，可以考虑sort等命令结合使用。


> 原文链接  https://blog.csdn.net/sinat_29325027/article/details/80887650