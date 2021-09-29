---
title: js数组方法整理
tags: JavaScript
abbrlink: 5570a359
date: 2021-09-29 15:16:06
---
# 创建数组
```javascript

let array = ['a', 'b']
```
# 访问数组

```javascript

  let a=array[0]

  //a
```
# 遍历数组

```javascript

 array.forEach(function(item, index, array) {
  console.log(item, index)
})
```

# 添加元素到数组的末尾

```javascript

 array.push('c')
```
# 删除数组最后一个元素

```javascript
 array.pop();
```
#  删除数组第一个元素

```javascript
array.shift()
```
# 添加元素到数组的第一位
```javascript
 array.unshift('1')
```

# 获取数组的长度

```javascript
let length=array.length;
```

# 获取某个元素在数组中的索引

```javascript

 let index=array.indexOf('a')
```

# 通过索引删除某个元素

```javascript

array.splice(1, 1)
```