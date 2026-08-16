# 第17章：JSON处理

## 17.1 JSON 对象概述

`JSON` 对象提供了 JSON 序列化和反序列化功能。

## 17.2 JSON.stringify 序列化

将对象转换为 JSON 字符串：

```matnn
Console.log("=== JSON 对象 ===");

Console.log("\n--- JSON.stringify 序列化 ---");

var person = {
    name: "Alice",
    age: 30,
    city: "Shanghai",
    hobbies: ["reading", "coding", "travel"],
    isStudent: false
};

var jsonStr = JSON.stringify(person);
Console.log("序列化后的 JSON 字符串:", jsonStr);
```

**输出结果**：

```
序列化后的 JSON 字符串: {"name":"Alice","age":30,"city":"Shanghai","hobbies":["reading","coding","travel"],"isStudent":false}
```

## 17.3 JSON.parse 反序列化

将 JSON 字符串转换为对象：

```matnn
Console.log("\n--- JSON.parse 反序列化 ---");

var parsedPerson = JSON.parse(jsonStr);
Console.log("反序列化后的对象:", parsedPerson);
Console.log("parsedPerson.name:", parsedPerson.name);
Console.log("parsedPerson.hobbies:", parsedPerson.hobbies);
```

**输出结果**：

```
反序列化后的对象: {name: "Alice", age: 30, city: "Shanghai", hobbies: ["reading", "coding", "travel"], isStudent: false}
parsedPerson.name: Alice
parsedPerson.hobbies: ["reading", "coding", "travel"]
```

## 17.4 复杂对象序列化

```matnn
Console.log("\n--- 复杂对象序列化 ---");

var complexObj = {
    data: {
        users: [
            {"id": 1, "name": "Alice"},
            {"id": 2, "name": "Bob"}
        ],
        meta: {
            total: 2,
            page: 1
        }
    },
    success: true
};

var complexJson = JSON.stringify(complexObj);
Console.log("复杂对象的 JSON:", complexJson);

var parsedComplex = JSON.parse(complexJson);
Console.log("解析后 data.users[0].name:", parsedComplex.data.users[0].name);
Console.log("解析后 success:", parsedComplex.success);
```

**输出结果**：

```
复杂对象的 JSON: {"data":{"users":[{"id":1,"name":"Alice"},{"id":2,"name":"Bob"}],"meta":{"total":2,"page":1}},"success":true}
解析后 data.users[0].name: Alice
解析后 success: true
```

## 17.5 数组序列化

```matnn
Console.log("\n--- 数组序列化 ---");

var arr = [1, 2, 3, "four", "five"];
var arrJson = JSON.stringify(arr);
Console.log("数组的 JSON:", arrJson);
var parsedArr = JSON.parse(arrJson);
Console.log("解析后数组:", parsedArr);
```

**输出结果**：

```
数组的 JSON: [1,2,3,"four","five"]
解析后数组: [1, 2, 3, "four", "five"]
```

## 17.6 嵌套对象

```matnn
Console.log("\n--- 嵌套对象 ---");

var nested = {
    outer: {
        inner: {
            value: 42
        }
    }
};

var nestedJson = JSON.stringify(nested);
Console.log("嵌套对象的 JSON:", nestedJson);
var parsedNested = JSON.parse(nestedJson);
Console.log("解析后 nested.outer.inner.value:", parsedNested.outer.inner.value);
```

**输出结果**：

```
嵌套对象的 JSON: {"outer":{"inner":{"value":42}}}
解析后 nested.outer.inner.value: 42
```

## 17.7 验证序列化往返

```matnn
Console.log("\n--- 验证序列化往返 ---");

var original = "test string for json serialization";
var json = JSON.stringify(original);
var parsed = JSON.parse(json);
Console.log("original:", original);
Console.log("json:", json);
Console.log("parsed:", parsed);
Console.log("original === parsed:", original === parsed);
```

**输出结果**：

```
original: test string for json serialization
json: "test string for json serialization"
parsed: test string for json serialization
original === parsed: true
```

## 17.8 本章小结

本章介绍了 Matnn 的 JSON 处理：

- `JSON.stringify()` 将对象转换为 JSON 字符串
- `JSON.parse()` 将 JSON 字符串转换为对象
- 支持复杂对象、数组和嵌套对象的序列化
- 可以验证序列化往返的正确性

下一章将介绍文件系统。