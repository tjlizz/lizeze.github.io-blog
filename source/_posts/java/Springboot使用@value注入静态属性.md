---
title: Springboot使用@value注入静态属性
date: 2021-09-10 10:44:39
tags: 
     - springboot
     
---
# Springboot @value 注解注入静态属性

``` java

@Component
public class FileTool {

    private static String proxyIp;

    @Value("${cim.http.proxy_ip}")
    public void setProxyIp(String _proxyIp) {
        proxyIp = _proxyIp;
    }
}

```

直接在属性上使用 `@value` 是无效的，要通过 `set` 方法注入， `class` 要加上 `@Component` 注解
