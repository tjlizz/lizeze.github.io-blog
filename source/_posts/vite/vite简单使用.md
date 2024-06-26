---
title: vite简单使用
tags: 编程相关
abbrlink: 896d8037
date: 2022-05-10 15:25:16
---

# Vite是什么

* `Vite`是一个开发服务器，它基于`原生ES模块`提供了丰富的内建功能，比如惊人的`模块热更新`

* 一套构建指令，它使用`Rollup`打包代码，并且是与配置的，可输出用于生产环境的高度优化过的静态资源

# 为什么使用Vite

## 存在的问题 

在浏览器支持`ES`模块之前，`Javascript`并没有提供原生机制让开发者以模块化的方式进行开发。所以就出现了`webpack`和`Parcel`等打包工具，它们也极大的改善了前端开发者的开发体验。

但是随着项目越来越大，需要处理的代码也注解的增长。开发体验就不是那么友好了，通常需要几十秒甚至几分钟才可以启动开发服务器，即便使用热更新，也得等到几秒之后才能在页面显示出来，极大地影响开发者的心情和开发效率。

## Vite的解决方案

当冷启动开发服务器时，基于打包器的方式启动必须优先抓取并构建你的整个应用，然后才能提供服务。

`Vite`通过一开始讲应用中的模块区分为`依赖`和`源码`两类，改进了开发服务器启动时间。

### 依赖

依赖大多为在开发时不会发生变动的纯`Javascript`。比如`axios`,一些较大的依赖处理起来也很高。

Vite会使用`esbuild预构建依赖`，这么做的目的有两个

 ####  `CommonJS` 和 `UMD` 兼容性

  开发阶段中，`Vite`的开发服务器将所有代码视为原生`ES模块`。因此，`Vite`必须先将作为`CommonJS` 或 `UMD` 发布的依赖项转换为 `ESM`。

#### 性能

 Vite将有许多内部模块的ESM依赖关系转换为单个模块，以便后续页面加载性能，

 > 一些包将他们的ES模块构建作为许多单独的文件相互导入。当执行`import`时，浏览器会同时发出多个HTTP请求。尽管服务器在处理这些请求时没有问题，但大量的请求会在浏览器端造成网络阻塞，导致页面的加载速度过慢。 通过预购建`lodash-es`成为一个模块，我们就只需要发出一个HTTP请求了。
 #### 缓存

 * 文件系统缓存
  
  Vite会将预购建的依赖缓存到`node_modules/.vite`, 它根据几个来源决定是否要重新运行与构建步骤 

  1. `package.json`中的`dependencies `列表

  2. 包管理器的`lockfile`，例如`package-lock.json`,`yarn.lock`,`pnpm-lock.yaml`

  3. 可能在`vite.config.js`相关字段中配置过的。

   只有在上述其中一项发生更改时，才需要重新允许预购建。

    如果出于某些原因，需要强制`vite`重新构建依赖，可以使用`--force`命令行选项启动开发服务器，或者手动删除缓存目录 `node_modules/.vite`

* 浏览器缓存

 解析后的依赖请求会以`HTTP`头`max-age=31536000,immutable`缓存。一旦被缓存，这些请求将永远不会在请求开发服务器。如果安装了不同版本，在附加不同的`query`使他们自动失效。

 
     