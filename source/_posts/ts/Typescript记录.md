---
title: TypeScript记录
tags:
  - typescript
abbrlink: 1bc3f4bd
date: 2022-09-05 15:45:33
---

# TS 中 interface 和 type 的区别是什么
## 不同点

 * type 可用于 string、number、bool、undefined、null 和元组，而 interface 只能描述对象（含数组、函数、包装对象）

 * 同名 interface 会合并，而同名 type 会报错

  * type 声明的是类型别名，而 interface 声明的是新类型。


  ## 相同点


  * 都能描述对象（含数组、函数、包装对象）

  * 都能用于扩展一个类型。type 用交叉类型做到这一点，interface 用 extends 做到这一点。