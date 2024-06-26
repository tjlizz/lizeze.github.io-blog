---
title: 使用PhantomJS在服务端生成图片
tags: node
abbrlink: 32db227c
date: 2021-09-12 13:23:22
---

# 概述
  有一个这样的需求，就是把页面上的`Echart`图表转换成图片保存到`word`中。
  
# 环境准备
  安装PhantomJS
  ```
  npm install phantomjs -g
  ```
  使用下面的命令，查看是否安装成功
  ```
  phantomjs --version
  ```
  # 实现
  ## webpage
   webpage模块是PhantomJS的核心模块，用于网页操作。
   ```javascript
  var webPage = require('webpage');
  var page = webPage.create();
   ```
 
# open()
open方法用于打开具体的网页。
```
var page = require('webpage').create();
page.open('http://127.0.0.1:8080/index.html', function (status) {
 page.render('google_home.png', { format: 'png' });
  phantom.exit();
});
```

# 测试
 执行
```
phantomjs  index.js
```

![](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2019/9/18/16d44d7ef2bf3192~tplv-t2oaga2asx-image.image)

# 参数

```
var webPage = require('webpage');
var page = webPage.create();
var system = require('system');
var list = (system.args + "").split(',');
```


![](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2019/9/18/16d44da62d269ca4~tplv-t2oaga2asx-image.image)

