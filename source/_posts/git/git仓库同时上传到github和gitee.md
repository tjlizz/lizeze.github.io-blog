---
title: git仓库同时上传到github和gitee
tags: 编程相关
abbrlink: f51db730
date: 2021-09-12 12:30:43
---

下载仓库到本地
```shell
git clone git@github.com:xx.git
```
移除现有仓库

```shell
git remote rm origin
```

关联GitHub的远程库

```
git remote add github git@github.com:xx.git
```
关联码云仓库
```
git remote add gitee git@xx.git
```

查看远程仓库
```
git remote -v
```

代码推送
```
git push github master

git push gitee master
```