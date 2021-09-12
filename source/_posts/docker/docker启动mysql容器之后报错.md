---
title: docker启动mysql容器之后报错
date: 2021-09-12 12:51:13
tags: 
     - docker
     - mysql
categories: docker
---


```mysql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
CREATE USER 'root'@'%' IDENTIFIED BY '你的密码';
grant all privileges on *.* to 'root'@'%'; 
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
flush privileges;

```

``` mysql

CREATE USER 'lzz'@'%' IDENTIFIED BY '123456';

grant all privileges on *.* to 'lzz'@'%' with grant option;

set global time_zone = '+8:00';

```

  mysql数据库时间少一天
```
characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
```

把`serverTimezone`值修改为`Asia/Shanghai`