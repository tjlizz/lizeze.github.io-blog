---
title: html知识点
tags: html
categories: html
abbrlink: 46c033c6
date: 2021-09-14 09:36:21
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

# Html 标签变量

```html
<head>
  <base href="https://www.twitter.com/" target="_blank" />
</head>

<body>
  <img src="elonmusk" alt="Elon Musk" />
  <a href="BillGates">Bill Gate</a>
</body>
```

`img`标签的完整地址是`https://www.twitter.com/elonmusk`

`a`标签同样

# 图片懒加载

```html
<img src="image.png" loading="lazy" alt="…" width="200" height="200" />
```

# 使用 CSS 固定 header 与 footer

```html
<div id="container">
  <header>header</header>

  <footer>footer</footer>
</div>
```

```css
header {
  position: sticky;
  top: 0;
}
footer {
  position: sticky;
  bottom: 0;
}
```

# 使用 Promise 实现任务进度

```javascript
const loadingBar = document.getElementById("loadingBar");

async function task() {
  return new Promise((res) => {
    setTimeout(res, Math.random() * 5000);
  });
}

function loadingBarStatus(current, max) {
  loadingBar.textContent = `Loading ${current} of ${max}`;
}

(async () => {
  let current = 1;
  const promises = new Array(100)
    .fill(0)
    .map(() => task().then(() => loadingBarStatus(current++, 100)));

  await Promise.all(promises);
  loadingBar.textContent = `Loading Finished`;
})();
```
