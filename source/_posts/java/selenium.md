---
title: Selenium实战
tags: java
abbrlink: d009cca4
date: 2021-09-29 11:48:06
---

# 安装依赖

```xml
        <dependency>
            <groupId>org.seleniumhq.selenium</groupId>
            <artifactId>selenium-java</artifactId>
            <version>3.141.59</version>
        </dependency>
```
# 安装浏览器驱动

[下载](https://www.selenium.dev/zh-cn/documentation/getting_started/installing_browser_drivers/#%E5%BF%AB%E9%80%9F%E5%8F%82%E8%80%83)安装

选择自己喜欢的浏览器，本文使用`Edge`

#  打开一个网页

```java

        System.setProperty("webdriver.edge.driver", "D:\\edgedriver_win32\\MicrosoftWebDriver.exe"); //上面下载的浏览器驱动
        WebDriver driver = new EdgeDriver();
        driver.get("https://www.baidu.com/");

```
# 定位元素

```java

    driver.findElement(By.id("kw")).sendKeys("java"); //输入内容

    driver.findElement(By.id("su")).click(); //点击按钮

    List<WebElement> muchoCheese = driver.findElements(By.cssSelector("#cheese li"));//获取多个与元素

```

# 获取页面cookie

```java
    Set<Cookie> cookies = driver.manage().getCookies();
        String cookieStr = "";
        for (Cookie cookie : cookies) {
                cookieStr+= cookie.getValue();

        }
```

# 浏览器加载扩展

```java

   File plugPath = new File("E:\\tsy\\tsy-tool.crx");
 
       //创建options对象
         ChromeOptions options = new ChromeOptions();
        options.addExtensions(plugPath);   
        WebDriver driver = new ChromeDriver(options); //这里使用的是chrome

```