---
title: 使用typescript与webpack搭建开发环境(四)
tags:
  - typescript
  - webpack
categories: TypeScript
abbrlink: 61f06ba6
date: 2021-09-10 21:33:15
---


**如何区分开发环境与生成环境**

 {% post_link ts/使用typescript与webpack搭建开发环境(三) 上一章 %}讲了开发环境`devtool`的使用，但是官方推荐不同的环境使用不同的配置，那么怎么来区分当前运行的是什么环境呢，这次讲一下这个。

# 安装依赖

```shell
$ yarn add -D webpack-merge
```
# 调整目录结构

增加`config`文件夹，将`webpack.config.js`文件移动到里面，保留基础配置，删除`mode`和`devtool`属性

在`config`文件夹中增加`webpack.conf.dev.js`，写入以下内容

```javascript
const merge = require('webpack-merge');
const common = require('./webpack.config.js');
let devConfig = {
    mode: "development",
    devtool: 'source-map',
};
module.exports = merge.merge(common, devConfig);
```

修改`package.json`

```javascript
 "scripts": {
    "start": "webpack serve --config config/webpack.conf.dev.js"
  },
```

执行 `yarn start`

# 最后
不同的环境创建不同的`webpack.conf.xxx.js`即可

注意修改`webconfig.conf.js`中的文件引用路径，因为它的位置改变了

[获取代码](https://github.com/lizeze/webpack-ts-demo/commit/feec9a282047efee507212df04c1a7706ecddcbf)