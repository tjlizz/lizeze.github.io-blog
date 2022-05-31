---
title: 发送ssh公钥到Linux服务器
tags:
  - Linux
  - SSH
abbrlink: 1c96518c
date: 2022-05-31 14:33:53
---


# 生成ssh公钥

```bash
$ ssh-keygen -t rsa

```
# 发送ssh公钥到Linux服务器

```bash

$ ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.1
```

# 链接Linux服务器

```bash
$ ssh root@192.168.1.1

```