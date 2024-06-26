---
title: Nginx配合后台服务控制文件的下载与预览
tags:
  - nginx
  - java
categories: Java
abbrlink: 71eca8f7
date: 2021-09-10 21:35:10
---

# 背景
最近接到一个项目，有这样一个需求，需要对部分文件的下载与预览增加权限控制，只允许会员用户使用，找了一些资料之后最后决定使用`Nginx`配合`Java`服务来实现这个功能。
> 只针对一些业务文件采用此方式，网页中的静态文件尽量不要使用这种方法，以免增加服务器的负担

#  配置Nginx
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210328130245299.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)

配置中使用`Nginx`开启了一个端口为`8086`的文件服务器,配置中增加了`internal`属性，表示文件只允许内部访问。在接收到请求后代理转发给了端口为`8080`的`Java`权限认证服务。

这些基本上就是`Nginx`的全部配置了，不是很复杂，配置完成之后记得重启，确保生效。

# Java服务

![在这里插入图片描述](https://img-blog.csdnimg.cn/2021032813145673.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)

后台使用`SpringBoot`搭建服务，在认证通过之后通过设置`ResponseHeader`通知`Nginx`是否返回请求的文件。

* Content-Type
* Content-Disposition
*  X-Accel-Redirect
> 三个主要的header
> 
更多的[header](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers)介绍

