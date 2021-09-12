---
title: 使用typescript与webpack搭建开发环境(三)
date: 2021-09-10 20:31:17
tags:
      - typescript
      - webpack
categories: TypeScript
---

**开发环境设置**

 {% post_link ts/使用typescript与webpack搭建开发环境(二) 上一章 %}
在日常开发的过程中，debug是避免不了的，我们都知道`webpack`是把文件打包了的，对于`debug`来说是非常不方便的，本章主要说一下怎么`debug`
# 准备环境
## 修改 webpack.config.js
```javascript
module.exports = {
    // mode: "development"
   }
```
把这行代码注释掉

## 新增一个ts文件
在`src`目录下新增一个名为`Person.ts`的文件，内容如下
![](https://img-blog.csdnimg.cn/img_convert/b922ae65ede35dd2b38ca147b3d50d98.png)
## 修改index.ts文件
之前的代码全部注释或删除，新增以下内容
![](https://img-blog.csdnimg.cn/img_convert/db9d0c53dd9f31f963331604d20430f1.png)

内容准备完成，现在来启动项目实践debug
# 启动调试

执行`yarn start` 现在开始调试项目
![](https://img-blog.csdnimg.cn/img_convert/6969296b6bc08265cb665320458de936.png)

启动之后我们会发现在终端中会出现这样一个提示，出现这个提示的原因是因为我们在第一步修改的`webpack.config.js`文件，`webpack`不知道该以什么模式启动项目了。
`mode`的类型有两个，分别是`development`和`production`,分别代表开会环境和正式环境。稍后在进行配置。

接下来打开浏览器会看到控制台

![](https://img-blog.csdnimg.cn/img_convert/e0c1755a8f3431461ec4b92db3d3cdea.png)

我们在调用方法的时候传入的参数是`undefined`,所以报这个错了，我们也知道怎么去改，可是在开发项目的过程中不可能每一个地方都记得特别清楚，我们是需要控制台去精准的提示给我们是哪里报凑了，从上图中我们可以看到是`main.js`文件的第2行报的错，我们点击它定位到错误位置。
![](https://img-blog.csdnimg.cn/img_convert/ce1dbd50a9adab2a2ee076cc8e41ea25.png)
出现在眼前的是这一行压缩的代码，它是打包过的代码，是不利于调试的。我们要使用`devtool`来解决这个问题
# devtool
>选择一种 source map 格式来增强调试过程。不同的值会明显影响到构建(build)和重新构建(rebuild)的速度。

`devtool`其实就是选择对应的`source map`，它有很多种，现在来看一下每种都有什么区别。
## source-map

这种是比较常见的，设置方法就是在`webpack.config.js`中修改这个属性，代码如下
```javascript
module.exports = {
    mode: "development", //恢复设置
    devtool: 'source-map',
   }
```
设置完成之后启动项目看一下效果

![](https://img-blog.csdnimg.cn/img_convert/88f50e2b3809c24b7b5d3b3746e5cf73.png)

精确的提示除了出错的文件和行数，方便我们准确的定位，那webpack究竟是做了什么呢。

* source-map会给打包后的模块生成soucemap文件

![debug-sourcemapurl.png](https://img-blog.csdnimg.cn/img_convert/9950d06b66251cb0753805ebf6d2a0f2.png)

打包后的模块在最下面引用一个map文件，map文件就是打包后的文件和源文件之间的一个关联文件，里面记录着编译后的代码对应着源码中的位置
* inline-source-map

 使用`inline`，`webpack`不会生成独立的`map`文件，而是将`map`文件内容以`dataURL`的形式插入到打包的文件中

![debug-inline.png](https://img-blog.csdnimg.cn/img_convert/f860fc745a8cb302f7d00111a37a12fb.png)
* cheap-source-map
它与`source-map`一样也是会生成独立的`map`文件，不同的是它不包含源代码中的列信息

* module-source-map

生成的`map`文件中还包含引用的一些第三方库
* eval-source-map
每个模块都被`eval`执行，并且使用`@sourceURL`的方式引入`map`文件
# 不同的环境该使用哪种source-map

不同环境的配置使用，建议参考官方[文档](https://webpack.js.org/configuration/devtool/#devtool),只有官方文档才是**最新最准确**的

[获取代码](https://github.com/lizeze/webpack-ts-demo)