---
title: css优先级
abbrlink: 8954c4f1
date: 2021-11-09 16:08:39
tags:
---


# 内联样式优先与Style标签

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        h1 {
            color: red;
        }
    </style>
</head>
<body>
    <h1 style="color: blue;">CSS测试</h1>
</body>
</html>
```
![](https://gitee.com/zeze.li/blogimage/raw/master/css-test-001.png)



# 后声明的优先于先声明的
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>style与link</title>
    <style>
        h1 {
            color: red;
        }
    </style>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <h1>CSS测试</h1>
</body>
</html>
```


`style.css`

```css
h1{color: blue;}
```
![](https://gitee.com/zeze.li/blogimage/raw/master/css-test-001.png)

# Style标签优先于link标签

>style标签在link标签后面的前提下,其实也是先后顺序的比较

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>style与link</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <style>
        h1 {
            color: red;
        }
    </style>
    <h1>CSS测试</h1>
</body>
</html>
```
`style.css`
```css
h1{color: blue;}
```
![](https://gitee.com/zeze.li/blogimage/raw/master/css-test-002.png)

# id优先与class
 > 即使class在id之后声明

 ```html
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>class与id</title>
    <style>
        #text {
            color: red;
        }
        .text {
            color: blue;
        }
    </style>
</head>
<body>
    <h1 class="text" id="text">CSS测试</h1>
</body>

</html>
 ```
 ![](https://gitee.com/zeze.li/blogimage/raw/master/css-test-002.png)

 # 选择器选择器越详细优先级越高

 
 ```html
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>选择器优先级</title>
    <style>
        .parent h1 {
            color: red;
        }
        h1 {
            color: blue;
        }
    </style>
</head>
<body>
    <div class="parent">
        <h1 id="text">CSS测试</h1>
    </div>
</body>
</html>
 ```
 ![](https://gitee.com/zeze.li/blogimage/raw/master/css-test-002.png)