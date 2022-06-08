---
title: 页面url的一些操作
tags:
  - js
abbrlink: c509c10d
date: 2022-06-08 14:54:23
---

#  获取URL的参数

```javascript

    function getQueryVariable(variable)
    {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }
```
## 示例

`http://127.0.0.1/a.html?id=1&name=a`

 getQueryVariable("id") 返回1

 getQueryVariable("name") 返回a

  getQueryVariable("age") 返回false