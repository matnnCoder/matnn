# 第16章：Date日期时间

## 16.1 Date 对象概述

`Date` 对象用于处理日期和时间。

## 16.2 获取当前日期时间

```matnn
Console.log("=== Date 日期对象 ===");

Console.log("\n--- 获取当前日期时间 ---");
var now = new Date();
Console.log("当前日期时间:", now);
```

**输出结果**：

```
当前日期时间: Wed Jul 15 2026 10:30:00 GMT+0800 (China Standard Time)
```

## 16.3 获取时间戳

```matnn
Console.log("\n--- 获取时间戳 ---");
Console.log("Date.now():", Date.now());
Console.log("now.getTime():", now.getTime());
```

**输出结果**：

```
Date.now(): 1784123400000
now.getTime(): 1784123400000
```

## 16.4 获取日期组件

```matnn
Console.log("\n--- 获取日期组件 ---");
Console.log("年:", now.getFullYear());
Console.log("月:", now.getMonth() + 1);
Console.log("日:", now.getDate());
Console.log("时:", now.getHours());
Console.log("分:", now.getMinutes());
Console.log("秒:", now.getSeconds());
Console.log("毫秒:", now.getMilliseconds());
Console.log("星期:", now.getDay());
```

**输出结果**：

```
年: 2026
月: 7
日: 15
时: 10
分: 30
秒: 0
毫秒: 0
星期: 3
```

## 16.5 日期字符串转换

```matnn
Console.log("\n--- 日期字符串转换 ---");
Console.log("toString():", now.toString());
Console.log("toISOString():", now.toISOString());
```

**输出结果**：

```
toString(): Wed Jul 15 2026 10:30:00 GMT+0800 (China Standard Time)
toISOString(): 2026-07-15T02:30:00.000Z
```

## 16.6 解析日期字符串

```matnn
Console.log("\n--- 解析日期字符串 ---");
var dateStr = "2024-01-15T10:30:00";
var parsedDate = new Date(dateStr);
Console.log("解析日期:", parsedDate);
Console.log("解析日期的年份:", parsedDate.getFullYear());
```

**输出结果**：

```
解析日期: Mon Jan 15 2024 10:30:00 GMT+0800 (China Standard Time)
解析日期的年份: 2024
```

## 16.7 创建指定日期

```matnn
Console.log("\n--- 创建指定日期 ---");
var specificDate = new Date(2024, 5, 15, 14, 30, 0);
Console.log("指定日期:", specificDate);
```

**输出结果**：

```
指定日期: Sat Jun 15 2024 14:30:00 GMT+0800 (China Standard Time)
```

## 16.8 日期比较

```matnn
Console.log("\n--- 日期比较 ---");
var date1 = new Date(2024, 0, 1);
var date2 = new Date(2024, 0, 15);
var ts1 = date1.getTime();
var ts2 = date2.getTime();
Console.log("date1时间戳:", ts1);
Console.log("date2时间戳:", ts2);
var isLess = ts1 < ts2;
var isGreater = ts1 > ts2;
Console.log("ts1 < ts2:", isLess);
Console.log("ts1 > ts2:", isGreater);
```

**输出结果**：

```
date1时间戳: 1704067200000
date2时间戳: 1705363200000
ts1 < ts2: true
ts1 > ts2: false
```

## 16.9 计算日期差

```matnn
Console.log("\n--- 计算日期差 ---");
var diff = date2.getTime() - date1.getTime();
var daysDiff = diff / (1000 * 60 * 60 * 24);
Console.log("两个日期相差天数:", daysDiff);
```

**输出结果**：

```
两个日期相差天数: 14
```

## 16.10 本章小结

本章介绍了 Matnn 的 Date 对象：

- 使用 `new Date()` 创建日期对象
- 使用 `Date.now()` 获取当前时间戳
- 使用 `getTime()` 获取时间戳
- 使用各种 get 方法获取日期组件
- 使用 `toString()` 和 `toISOString()` 转换为字符串
- 支持日期比较和日期差计算

下一章将介绍 JSON 处理。