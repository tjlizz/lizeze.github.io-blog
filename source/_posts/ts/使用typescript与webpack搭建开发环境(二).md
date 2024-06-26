---
title: 使用typescript与webpack搭建开发环境(二)
tags:
  - typescript
  - webpack
categories: TypeScript
abbrlink: e540a482
date: 2021-09-10 21:17:28
---

**静态资源的引入**

{% post_link ts/使用typescript与webpack搭建开发环境(一) 上一章 %}中已经搭建好开发环境，下面开始逐渐丰富项目的内容，本章是静态资源的引入。

# 安装依赖

`webpack`默认是只认识`JavaScript`的，只知道该怎么处理它，如果项目中出现了其他类型的文件，并且也希望`webpack`对它进行打包的时候，就要安装对应的`loader`了。

 `loader`是什么，下面内容源自`webpack`[中文网站](https://www.webpackjs.com/concepts/loaders/)
 >loader 用于对模块的源代码进行转换。loader 可以使你在 import 或"加载"模块时预处理文件。因此，loader 类似于其他构建工具中“任务(task)”，并提供了处理前端构建步骤的强大方法。loader 可以将文件从不同的语言（如 TypeScript）转换为 JavaScript，或将内联图像转换为 data URL。loader 甚至允许你直接在 JavaScript 模块中 import CSS文件！
 
 # css-loader
 
 ```shell
 $ yarn add css-loader style-loader -D
 ```
 在`src`文件夹中创建第一个`css`文件，命名为`index.css`
 
 ```css
 .hello{
    color:red;
}
 ```
 修改`index.ts`文件
 ![](https://img-blog.csdnimg.cn/img_convert/27d15fd81d28dc2b3526209eb0a4eee0.png)
 
修改`webpack.config.js`

```javascript
 module: {
        rules: [
          +  {
          +    test: /\.css$/,
          +    use: ['style-loader', 'css-loader']
          + }
        ],
    }
```
 # file-loader
  `file-loader`用于引入图片文件
  
  ```shell
  $ yarn add file-loader -D
  ```
  修改`index.ts`文件，并在src文件夹内增加一张`png`图片
  
  ```TypeScript
  import img from  "./index.png"
  let image: HTMLImageElement = document.createElement("img");
  image.src = img;
  document.body.append(image);
  ```
  修改`webpack.config.js`
  ```javascript
   module: {
        rules: [
            +{
            +   test: /\.(png|jpe?g|gif)$/i,
            +  use:['file-loader'],
            +},
        ],
    },
  ```
  
# 最后
关于`css`和`image`的配置就是这些了，现在运行启动命令就可以看到网页上的字已经是红色了，并且添加了一张图片

[更多loader](https://webpack.js.org/concepts/loaders/)

