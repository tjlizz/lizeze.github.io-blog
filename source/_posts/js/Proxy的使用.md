---
title: Proxy基础用法
tags: JavaScript
abbrlink: 365c4e09
date: 2021-09-17 16:44:13
---
Proxy意思为`代理`，即在访问对象之前建立一道`拦截`，任何访问该对象的操作之前都会通过这道`拦截`。

# `Proxy`可以拦截什么

* `getPrototypeOf()`
  


* `setPrototypeOf()`



* `isExtensible()`
  


* `preventExtensions()`


* `getOwnPropertyDescriptor()`

* `defineProperty()`
* `has()`
* `get()`
* `set()`
* `deleteProperty()`
* `ownKeys()`
* `apply()`
* `construct()`
 
# 实例
## Proxy语法

```javascript
let proxy = new Proxy(target, handler);
```

 这就是`Proxy`的使用方法，所有的用法都是上面的方法，不同的是`handler`里面拦截的设置
 
 `new Proxy()`表示生成一个`Proxy`实例

 `target`表示要拦截的目标对象

 `handler`是一个对象，用来定制拦截方法

**想要`handler`里的拦截方法生效，后续所有操作必须使用`Proxy`的实例**
## get

`get`方法在日常开发中应该是使用最多的方法了