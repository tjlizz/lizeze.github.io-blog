---
title: nginx反向代理websocket
abbrlink: efc4f59c
date: 2022-07-05 11:52:33
tags:
     - nginx
     - websocket
---


```
http {
    include mime.types;
    default_type application/octet-stream;
    map $http_upgrade $connection_upgrade {
        default upgrade;
        ''   close;
    }


 location /socketserver {

    proxy_pass http://127.0.0.1:8082;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
}
}


```