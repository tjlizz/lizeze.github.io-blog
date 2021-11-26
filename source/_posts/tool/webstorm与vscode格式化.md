---
title: webstorm与vscode格式化
tags: jenkins
abbrlink: a710b611
date: 2021-11-26 09:15:04
---


到了新公司发现同事用的都是VSCode，而VSCode的格式化代码与WebStorm的不一致。

因为前后端都做，用惯了JetBrains全家桶，导致不太适应VSCode，最后所以打算调整一下代码的格式化，继续用webstorm开发。

* 自闭合的标签，闭合前补充空格

`Settings > Editor > Code Style > HTML > Other(Tab页) > 勾选 in empty tag`

* 句尾冒号分割，永远使用单引号，多行保留最后一项的逗号

`Settings > Editor > Code Style > JavaScript > Punctuation(Tab页) >`
```
use semicolon to terminate statement always
use single quotes always
Trailing comma Add when multiline
```
 
* 使用空格代替tab，tab展示为两个空格，代码缩进为两个空格

`Settings > Editor > Code Style > JavaScript > Tabs and Indents(Tab页) > 不勾选 Use Tab character`

```
Tab Size: 2
Indent: 2
Continuation indent: 2
```
 
* 对象花括号和中间键值填充空格(包括ES6 的import export)

`Settings > Editor > Code Style > JavaScript > Spaces(Tab页) > Within > 勾选Object literal braces 和 ES6 import/export braces`
————————————————
版权声明：本文为CSDN博主「咕了个咕」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Azhuzhu_chaste/article/details/106636056