---
title: linux设置开机启动
tags: linux
abbrlink: b9f29ac6
date: 2021-09-12 12:54:48
---


# 创建一个脚本
```shell
$ vim auto_run_script.sh

#!/bin/bash
date >> /tmp/output.txt
hostname >> /tmp/output.txt
```
# 保存退出后，再给它赋予可执行权限
```shell
$ chmod 777  auto_run_script.sh
```

# 创建启动服务

 ```shell
$ cd /etc/systemd/system

$ vim auto_run_script.service

[Unit]
Description=Run a Custom Script at Startup
After=default.target

[Service]
ExecStart=/auto_run_script.sh

[Install]
WantedBy=default.target

```
保存退出

# 启动服务
```
$ systemctl daemon-reload
$ systemctl enable auto_run_script.service
```