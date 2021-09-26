---
title: webapi常用方法
tags: JavaScript
abbrlink: db7e49b1
date: 2021-09-26 11:09:59
---
# Web Api 的概念

 浏览器提供了一些操作浏览器功能与页面元素的API,本次整理了一些常用操作页面元素的Api

# document.querySelector()

该方法会返回文档中与指定选择器或选择器组匹配的第一个页面元素。如果找不到匹配项，则返回`null`

## 语法

```javascript
 let element = document.querySelector(selectors);
```
## 参数 
* selectors

  该字符串必须是有效的`CSS`选择器字符串

## 返回值

 文档中与指定的一组`CSS`选择器匹配的第一个页面元素。如果没有匹配到，则返回`null`。

## 实例
### 实例1
 ```html
 <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <div class="first">
      <span class="text">1</span>
      <span class="text">2</span>
      <span class="text">3</span>
      <span class="text">4</span>
    </div>
  </body>
</html>

 ```
 以这个页面为基础,比如我想获取第一个`class`是`text`的内容,写法如下
 ```javascript
 let element=document.querySelector('.text').textContent;
 console.log(element); //1
 ```
 [运行代码](https://codepen.io/lizeze/pen/RwgeXNL?editors=1111)

按照预期，输出的内容是`1`,是我想要的结果

页面中有多个`class`为`test`的元素，但是精准的返回了我们要想的`1`，是因为该方法只会**匹配页面中查到的第一个元素**
 

### 实例2

还用上面的页面为例，如果我想获取到页面中第二个`class`为`text`的元素该怎么写呢。

```javascript
let element=document.querySelector('span.text:nth-child(2)').textContent;
console.log(element); //2

```
[运行代码](https://codepen.io/lizeze/pen/WNOaVrL?editors=1111)

 该方法支持**复杂选择器**

### 实例3

页面元素中`id`应该是唯一的,但是在实际开发中很有可能会出现一个页面中有多个相同`id`的元素,那这个时候使用这个方法会得到什么呢。

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <span id="first">1</span>
    <span id="first">2</span>
  </body>
</html>

```
 页面中有两个`id`为`first`的元素,我们执行该方法看一下效果

 ```javascript
 let element=document.querySelector('#first').textContent;
 console.log(element); //1
 ```
 返回结果是1
 [运行代码](https://codepen.io/lizeze/pen/mdwzNEX?editors=1111)

 **就算页面中有多个`id`重复的元素，也是返回第一个元素**

 # document.querySelectorAll()

 返回与指定的选择器组匹配的文档中的元素列表。

 ## 语法

 ```javascript
 let elementList = document.querySelectorAll(selectors);
 ```

 ## 参数

  *  selectors

这个字符串必须是一个合法的 `CSS`选择器字符串 

 >如果selectors参数中包含 CSS伪元素，则返回的列表始终为空。

## 返回值
一个静态 `NodeList`，包含一个与至少一个指定选择器匹配的元素的`Element`对象，或者在没有匹配的情况下为空`NodeList`

## 实例

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <div class="first">
      <span class="text">1</span>
      <span class="text">2</span>
      <span class="text">3</span>
      <span class="text">4</span>
    </div>
  </body>
</html>

```

```javascript

 let elementList = document.querySelectorAll('.text');
console.log(elementList) // [object NodeList] (4)
```
# document.images

返回当前文档中所有 `image` 元素的集合.

##  语法

```javascript
let imageCollection = document.images;
```
## 返回值

`HTMLImageElement`集合，当前页面的所有图片元素

## 实例

```javascript
let ilist = document.images;
for(var i = 0; i < ilist.length; i++) {
    if(ilist[i].src == "logo.png") {
        
    }
}
```