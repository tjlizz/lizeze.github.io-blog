---
title: 使用typescript与webpack搭建开发环境(一)
tags: 编程相关
abbrlink: 4a713fe0
date: 2021-09-10 21:16:29
---
使用typescript与webpack搭建开发环境
# 项目初始化

```shell
$ yarn init -y
```
>本文全部使用yarn命令，没有安装的可以执行下面使用npm安装
```shell
$ npm i -g yarn
```

# 安装依赖

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210307115029359.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)

将上面内容拷贝到项目中的`package.json`文件中，执行安装命令
```shell
$ yarn install 
```

# 项目配置
## 初始化tsconfig.json
```shell
$ tsc --init
```
> 如果出现tsc不是正常的命令错误提示 可在命令前面添加`npx` 然后在执行
执行成功之后修改tsconfig,写入以下内容

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210307115618672.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)





> 更多配置选项可参考[官方文档](https://www.typescriptlang.org/tsconfig)
## webpack.config.js
在项目根目录下增加`webpack.config.js`,内容如下

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210307115108907.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)
> 更多配置选项可参考[官方文档](https://webpack.js.org/guides/)
到这里项目的配置项基本已经全部完成了，下面开始写代码
# 增加第一个ts文件

在项目目录增加`src`文件夹，并创建第一个文件`index.ts`,内容如下
![](https://img-blog.csdnimg.cn/20210307115200520.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)

完成之后运行一下项目，验证一下

# 项目启动
项目启动有两种方式，一种是直接在终端中输入`webpack serve`来启动或者使用`yarn`命令启动，我们使用第二种方式。
首先配置`yarn`的启动脚本

在`package.json`中增加以下代码

```json
  "scripts": {
    "start": "webpack serve"
  }
```
下面我们就可以在终端中直接输入`yarn start`来启动项目了，执行之后会看到以下提示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210307115211886.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)

项目顺利启动，并在本地启动了一个端口为`8080`的服务,我们可以直接在浏览器中那个访问

`http://localhost:8080/`

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210307115228200.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2xpNTY3Mg==,size_16,color_FFFFFF,t_70)
 获取源码点击[这里](https://github.com/xx996/webpack-ts-demo)