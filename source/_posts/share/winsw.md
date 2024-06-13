---
title: winsw注册win服务-实现开机启动
tags: 工具
abbrlink: 6bb7ec47
date: 2024-06-13 14:28:01
---

# 支持的平台

`WinSW` 可以在安装在`.NET Framework 4.6.1` 或更高版本的`Windows` 平台上运行。对于没有 `.NET Framework` 的系统，该项目提供基于 `.NET 7` 的本机 64 位和 32 位可执行文件。

# 下载

[GitHub Releases](https://github.com/winsw/winsw/releases)

# 开始使用

## 创建配置文件

```xml
<service>
<id>my-server</id>
<name>my-server</name>
<description>this service is my-server</description>
<env name="HOST" value="127.0.0.1"/>
<executable>java</executable>
<arguments>-Xrs -Xmx256m -jar "%BASE%\jenkins.war" --httpPort=8080</arguments>
<log mode="roll"></log>
</service>
```

## 安装服务

> winsw.exe 与配置文件放在同一目录下

    ```shell
    $ winsw install  # 安装服务
    $ winsw uninstall  # 卸载服务
    $ winsw start  # 启动服务
    $ winsw stop  # 停止服务
    $ winsw restart  # 重启服务
    $ winsw status  # 查看服务状态
    ```
 其他命令请查看[官方文档](https://github.com/winsw/winsw)
