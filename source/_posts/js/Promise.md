---
title: Promise知识整理
abbrlink: ce0623bf
date: 2021-09-26 14:07:31
tags: JavaScript
---

 # Promise 的含义

   `Promise` 是异步编程的一种解决方案，比传统的解决方案——回调函数和事件——更合理和更强大。它由社区最早提出和实现，ES6 将其写进了语言标准，统一了用法，原生提供了`Promise`对象。

# Promise的特点

* 对象的状态不受外界影响

  `Promise`对象代表一个异步操作，有三种状态，**pending**、**fulfilled**、**rejected**，只有异步操作的结果可以决定当前是哪一种状态，其他任何操作都无法改变这个状态。

* 一旦状态改变，就不会在变，任何时候都可以得到这个结果。
  `Promise`对象的状态改变只有两种可能,从**pending**变为**fulfilled**,从**pending**变为**rejected**。只要这两种情况发生，状态就凝固了，不会在改变，会一直保持这个结果，这时就成为`resolved`。如果改变已经发生了，你在对`Promise`对象添加回调函数，也会立即得到这个结果。

* 也有一些缺点

  无法**取消**`Promise`,一旦创建对象就会**立即执行**,无法中途取消。

  如果不设置回调函数,`Promise`内部抛出的错误,不会反应到外部。

  当处于`pending`状态时,无法得到当前进展到哪一阶段

  
  >参考阮一峰老师的[ECMAScript 6 入门](https://es6.ruanyifeng.com/#docs/promise)

# 语法

```javascript

 const promise = new Promise(function(resolve, reject) {
  // ... some code

  if (/* 异步操作成功 */){
    resolve(value);
  } else {
    reject(error);
  }
});
```
`Promise`构造函数接受一个函数做为参数,该函数的两个参数分别是`resolve`和`reject`。它们是两个函数，由`JavaScript `引擎提供

`resolve`函数的作用是,将`Promise`对象的状态从`pending `改为`fulfilled`,并且将异步结果传递出去。

`reject`函数的作用是,将`Promise`对象的状态从`pending`改为`rejected`,并将异步异常传递出去

# then 方法


`Promise`对象创建完成后,可以用`then`方法分别指定`resolve`和`rejected`状态的回调函数
```javascript
function ajaxGet(url) {
  return new Promise((resolve, reject) => {
    if (url !== "api") {
      reject(url + "请求失败");
    }

    setTimeout(function () {
      resolve(url + "请求完成");
    }, 1000);
  });
}
ajaxGet("api").then(
  (data) => {
    console.log(data);
  },
  (error) => {
    console.error(error);
  }
);

ajaxGet("api11").then(
  (data) => {
    console.log(data);
  },
  (error) => {
    console.error(error);
  }
);


```
 [运行代码](https://codepen.io/lizeze/pen/rNwQBqv?editors=1111)

上面的代码中使用`Promise`对象模拟了一个从后台服务取数据的过程,`ajaxGet`方法只有一个简单的逻辑判断,如果传如的参数是`api`那么会在一秒之后返回成功，否则，立即返回失败。

上面代码的返回结果是

```javascript
//"api11请求失败"  
//"api请求完成"
```

Promise对象创建后会立即执行，所以先输出第二个方法的返回值，此时第一个还在等待状态变成完成

# catch 方法

Promise.prototype.catch()方法是.then(null, rejection)或.then(undefined, rejection)的别名，用于指定发生错误时的回调函数。


 如果异步操作发生了异常,状态变成了`rejected`,就会调用`catch`方法指定的函数，处理这个异常。如果`then`方法指定的回调函数中发生了异常，也会被`catch`方法捕获   

 
 ```javascript
 ajaxGet("api11").then(
  (data) => {
    console.log(data);
  }
).catch(error=>{
   console.error(error)
  
});

 ```
 
 [运行代码](https://codepen.io/lizeze/pen/yLXQLyK?editors=1111)


```javascript

ajaxGet("api").then(
  (data) => {
    console.log(data);
      throw 'error!';
  }
).catch(error=>{
   console.error(error) //then方法中的异常也会捕捉到
  
});

```

[运行代码](https://codepen.io/lizeze/pen/eYRQYpL?editors=1111)

# finally 方法

`finally`方法是不管`Promise`对象最后状态如何，都会执行的操作。和`try catch`中的`finally`方法是一样的

下面是一个例子，最后使用`finally`方法输出一段内容



```javascript
 
ajaxGet("api").then(
  (data) => {
    console.log(data);
  },
  (error) => {
    console.error(error);
  }
).finally(()=>{
  console.log('不管成不成功，我都会输出')
});

ajaxGet("api11").then(
  (data) => {
    console.log(data);
  },
  (error) => {
    console.error(error);
  }
).finally(()=>{
  
  console.log('不管成不成功，我都会输出')
});

//"api11请求失败"
//"不管成不成功，我都会输出"
//"api请求完成"
//"不管成不成功，我都会输出"
```

 [运行代码](https://codepen.io/lizeze/pen/BaZGxVG?editors=1111)

 `finally`的回调函数是没有参数的，无法得知`Promise`对象的结果是什么,这也表明不管最后的返回结果是什么，它都会执行