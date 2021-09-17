---
title: Proxy基础用法
tags: JavaScript
abbrlink: 365c4e09
date: 2021-09-17 16:44:13
---

Proxy 意思为`代理`，即在访问对象之前建立一道`拦截`，任何访问该对象的操作之前都会通过这道`拦截`。

# `Proxy`可以拦截什么

- `getPrototypeOf()`

- `setPrototypeOf()`

- `isExtensible()`

- `preventExtensions()`

- `getOwnPropertyDescriptor()`

- `defineProperty()`
- `has()`
- `get()`
- `set()`
- `deleteProperty()`
- `ownKeys()`
- `apply()`
- `construct()`

# 实例

## Proxy 语法

```javascript
let proxy = new Proxy(target, handler);
```

这就是`Proxy`的使用方法，所有的用法都是上面的方法，不同的是`handler`里面拦截的设置

`new Proxy()`表示生成一个`Proxy`实例

`target`表示要拦截的目标对象

`handler`是一个对象，用来定制拦截方法

**想要`handler`里的拦截方法生效，后续所有操作必须使用`Proxy`的实例**

## get

`get`方法在日常开发中应该是使用最多的方法了,先看一下在不使用`Proxy`时候的场景

```javascript
let user = {
  name: "张三",
};
console.log(user.name); //张三
console.log(user.age); //undefined
```

[运行代码](https://codepen.io/lizeze/pen/wveyzmm?editors=1011)

上面代码中，使用`let`定义了一个对象，并且有一个`name`属性

然后分别打印出`name`和`age`属性,结果很明显，`age`属性未定义会输出`undefined`

但是在实际项目中我们是不希望返回`undefined`这种值给页面的，下面我们就看一下怎么使用`Proxy`解决这个问题

```javascript
let handler = {
  //定义了get方法的拦截器
  get: function (target, key) {
    //target:要拦截的对象
    //key: 修改的属性
      if(target.hasOwnProperty(key)){
          if(key=='name'){
           return "法外狂徒-张三"
         }
      }
       return "18"
  }
};
let obj = {
  name: "张三"
};
let user = new Proxy(obj, handler);

//注意，这里的user不是上个示例的user对象了,而是Proxy的实例
console.log(user.name); //法外狂徒-张三

console.log(user.age); //18

```

[运行代码](https://codepen.io/lizeze/pen/OJgQRKw)

使用了`Proxy`之后,发现和之前什么都不一样了，这是因为我们设置了`get`方法的拦截，当获取`name`属性的时候，我们返回一个固定的值，否则就返回年龄18。

>这里是不太严谨的，实际项目中不可能只有两个字段的，这里只是为了演示

**想要`handler`里的拦截方法生效，后续所有操作必须使用`Proxy`的实例**

这个时候可以验证一下这句话，我们不使用`Proxy`实例,看看会怎么样

[运行代码](https://codepen.io/lizeze/pen/wveyoEV?editors=1111)

## set

在实际项目中，我们会经常进行修改某个对象的属性，有时候在一些特殊的场景下需要对对象修改的新属性进行判断，看是否符合当前的业务场景。

我在银行存了10块钱，每次去取1块钱，当我第十一次去的时候，银行这个时候肯定不会再给我钱了，下面可以使用`Proxy`了模拟一下取钱的操作。