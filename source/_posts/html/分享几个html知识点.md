---
title: html知识点
date: 2021-09-14 09:36:21
tags: html
categories: html
---

# Img 标签在不同设备上显示不同的图片

```html
<picture>
  <source media="(min-width:768px)" srcset="med_flag.jpg" />
  <source media="(min-width:495px)" srcset="small_flower.jpg" />
  <img src="high_flag.jpg" alt="Flags" style="width:auto;" />
</picture>
```

# 快速搜索匹配项

```html
<label for="country">Choose your country from the list:</label>
<input list="countries" name="country" id="country" />

<datalist id="countries">
  <option value="UK"></option>
  <option value="Germany"></option>
  <option value="USA"></option>
  <option value="Japan"></option>
  <option value="India"></option>
</datalist>
```
# Html标签变量

```html

<head>
  <base href="https://www.twitter.com/" target="_blank">
</head>

<body>
<img src="elonmusk" alt="Elon Musk">
<a href="BillGates">Bill Gate</a>
</body>
```

 `img`标签的完整地址是`https://www.twitter.com/elonmusk`
 
 `a`标签同样

 #  图片懒加载
 ```html

 
<img src="image.png" loading="lazy" alt="…" width="200" height="200">
 ```