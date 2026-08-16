# 第9章：Console与类型检测

## 9.1 Console 对象

`Console` 对象用于输出信息到控制台，支持多种输出方法：

### log()

输出普通日志信息：

```matnn
Console.log("这是 log 输出");
```

### info()

输出信息性消息：

```matnn
Console.info("这是 info 输出");
```

### warn()

输出警告信息：

```matnn
Console.warn("这是 warn 输出");
```

### error()

输出错误信息：

```matnn
Console.error("这是 error 输出");
```

### 多个参数

`Console.log()` 支持多个参数：

```matnn
var name = "Matnn";
var version = 1.0;
Console.log("名称:", name, "版本:", version);
Console.log("多个参数:", 1, 2, 3, "a", "b", "c");
```

**输出结果**：

```
名称: Matnn 版本: 1
多个参数: 1 2 3 a b c
```

## 9.2 typeof 运算符

`typeof` 运算符用于获取值的类型：

```matnn
var num = 42;
var str = "hello";
var bool = true;
var arr = [1, 2, 3];
var obj = {name: "Alice"};
var func = function() {};
var nullVal = null;

Console.log("typeof num:", typeof num);
Console.log("typeof str:", typeof str);
Console.log("typeof bool:", typeof bool);
Console.log("typeof arr:", typeof arr);
Console.log("typeof obj:", typeof obj);
Console.log("typeof func:", typeof func);
Console.log("typeof nullVal:", typeof nullVal);
```

**输出结果**：

```
typeof num: number
typeof str: string
typeof bool: boolean
typeof arr: object
typeof obj: object
typeof func: function
typeof nullVal: object
```

## 9.3 instanceof 运算符

`instanceof` 运算符用于检查对象是否是特定类的实例：

```matnn
var arr2 = [1, 2, 3];
var obj2 = {name: "Bob"};

Console.log("arr2 instanceof Array:", arr2 instanceof Array);
Console.log("obj2 instanceof Object:", obj2 instanceof Object);
```

**输出结果**：

```
arr2 instanceof Array: true
obj2 instanceof Object: true
```

## 9.4 结合 typeof 进行类型检查

```matnn
function printType(value) {
    var type = typeof value;
    switch (type) {
        case "number":
            Console.log(value, "是数字");
            break;
        case "string":
            Console.log(value, "是字符串");
            break;
        case "boolean":
            Console.log(value, "是布尔值");
            break;
        case "object":
            Console.log(value, "是对象或数组");
            break;
        case "function":
            Console.log(value, "是函数");
            break;
        default:
            Console.log(value, "的类型是", type);
    }
}

printType(123);
printType("hello");
printType(true);
printType([1, 2, 3]);
```

**输出结果**：

```
123 是数字
hello 是字符串
true 是布尔值
[1, 2, 3] 是对象或数组
```

## 9.5 本章小结

本章介绍了 Matnn 的 Console 对象和类型检测：

- `Console.log()`、`Console.info()`、`Console.warn()`、`Console.error()` 用于输出信息
- `typeof` 运算符用于获取值的类型
- `instanceof` 运算符用于检查对象是否是特定类的实例
- 可以结合 `typeof` 和 `switch` 进行类型检查

下一章将介绍 Math 数学对象。