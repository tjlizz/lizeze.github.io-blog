---
title: 使用js下载文件
tags: 编程相关
abbrlink: 39437d16
date: 2021-09-12 12:46:20
---

```javascript
 var url = 'download/?filename=aaa.txt';
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);      
    xhr.responseType = "blob";    
    xhr.onload = function () {
        if (this.status === 200) {
            var blob = this.response;
            var reader = new FileReader();
            reader.readAsDataURL(blob);     
            reader.onload = function (e) {
                var a = document.createElement('a');
                a.download = 'name';
                a.href = e.target.result;
                $("body").append(a);   
                a.click();
                $(a).remove();
            }
        }
    };
    xhr.send()
```