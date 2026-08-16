# 第20章：Map与Set

## 20.1 Map 对象概述

`Map` 对象用于存储键值对，键可以是任意类型。

## 20.2 创建 Map

```matnn
Console.log("=== Map 对象 ===");

var map = new Map();
Console.log("创建空 Map:", map);
```

**输出结果**：

```
创建空 Map: Map {}
```

## 20.3 添加和获取元素

```matnn
Console.log("\n--- 添加和获取元素 ---");
map.set("name", "Matnn");
map.set("version", "1.0");
map.set(1, "one");
map.set(true, "boolean");

Console.log("map.get('name'):", map.get("name"));
Console.log("map.get('version'):", map.get("version"));
Console.log("map.get(1):", map.get(1));
Console.log("map.get(true):", map.get(true));
```

**输出结果**：

```
map.get('name'): Matnn
map.get('version'): 1.0
map.get(1): one
map.get(true): boolean
```

## 20.4 检查键是否存在

```matnn
Console.log("\n--- 检查键是否存在 ---");
Console.log("map.has('name'):", map.has("name"));
Console.log("map.has('age'):", map.has("age"));
```

**输出结果**：

```
map.has('name'): true
map.has('age'): false
```

## 20.5 删除元素

```matnn
Console.log("\n--- 删除元素 ---");
map.delete(1);
Console.log("删除键1后 map.has(1):", map.has(1));
```

**输出结果**：

```
删除键1后 map.has(1): false
```

## 20.6 获取大小

```matnn
Console.log("\n--- 获取大小 ---");
Console.log("map.size:", map.size);
```

**输出结果**：

```
map.size: 3
```

## 20.7 遍历 Map

```matnn
Console.log("\n--- 遍历 Map ---");
map.forEach(function(value, key) {
    Console.log(key + ": " + value);
});
```

**输出结果**：

```
name: Matnn
version: 1.0
true: boolean
```

## 20.8 Set 对象概述

`Set` 对象用于存储唯一值的集合。

## 20.9 创建 Set

```matnn
Console.log("\n=== Set 对象 ===");

var set = new Set();
Console.log("创建空 Set:", set);
```

**输出结果**：

```
创建空 Set: Set {}
```

## 20.10 添加元素

```matnn
Console.log("\n--- 添加元素 ---");
set.add(1);
set.add(2);
set.add(3);
set.add(2);
Console.log("set:", set);
Console.log("set.size:", set.size);
```

**输出结果**：

```
set: Set {1, 2, 3}
set.size: 3
```

## 20.11 检查元素是否存在

```matnn
Console.log("\n--- 检查元素是否存在 ---");
Console.log("set.has(1):", set.has(1));
Console.log("set.has(4):", set.has(4));
```

**输出结果**：

```
set.has(1): true
set.has(4): false
```

## 20.12 删除元素

```matnn
Console.log("\n--- 删除元素 ---");
set.delete(2);
Console.log("删除2后 set:", set);
Console.log("set.size:", set.size);
```

**输出结果**：

```
删除2后 set: Set {1, 3}
set.size: 2
```

## 20.13 遍历 Set

```matnn
Console.log("\n--- 遍历 Set ---");
set.forEach(function(value) {
    Console.log(value);
});
```

**输出结果**：

```
1
3
```

## 20.14 本章小结

本章介绍了 Matnn 的 Map 和 Set：

- **Map**：存储键值对，键可以是任意类型
  - `set(key, value)` 添加键值对
  - `get(key)` 获取值
  - `has(key)` 检查键是否存在
  - `delete(key)` 删除键值对
  - `size` 获取大小
  - `forEach()` 遍历

- **Set**：存储唯一值的集合
  - `add(value)` 添加值
  - `has(value)` 检查值是否存在
  - `delete(value)` 删除值
  - `size` 获取大小
  - `forEach()` 遍历

下一章将介绍加密模块。