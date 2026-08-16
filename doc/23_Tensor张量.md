# 第23章：Tensor张量

## 23.1 Tensor 对象概述

`Tensor` 对象用于进行张量运算，支持多维数组操作和神经网络计算。

## 23.2 创建 Tensor

```matnn
Console.log("=== Tensor 张量 ===");

Console.log("\n--- 创建 Tensor ---");
var t1 = new Tensor([1, 2, 3, 4]);
var t2 = new Tensor([[1, 2], [3, 4]]);
var t3 = new Tensor([[[1, 2], [3, 4]], [[5, 6], [7, 8]]]);

Console.log("一维 Tensor:", t1);
Console.log("二维 Tensor:", t2);
Console.log("三维 Tensor:", t3);
```

**输出结果**：

```
一维 Tensor: Tensor {shape: [4], data: [1, 2, 3, 4]}
二维 Tensor: Tensor {shape: [2, 2], data: [[1, 2], [3, 4]]}
三维 Tensor: Tensor {shape: [2, 2, 2], data: [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]}
```

## 23.3 获取形状

```matnn
Console.log("\n--- 获取形状 ---");
Console.log("t1.shape:", t1.shape);
Console.log("t2.shape:", t2.shape);
Console.log("t3.shape:", t3.shape);
```

**输出结果**：

```
t1.shape: [4]
t2.shape: [2, 2]
t3.shape: [2, 2, 2]
```

## 23.4 获取数据

```matnn
Console.log("\n--- 获取数据 ---");
Console.log("t1.data:", t1.data);
Console.log("t2.data:", t2.data);
```

**输出结果**：

```
t1.data: [1, 2, 3, 4]
t2.data: [[1, 2], [3, 4]]
```

## 23.5 张量加法

```matnn
Console.log("\n--- 张量加法 ---");
var t4 = new Tensor([1, 1, 1, 1]);
var tAdd = Tensor.add(t1, t4);
Console.log("t1 + t4:", tAdd.data);
```

**输出结果**：

```
t1 + t4: [2, 3, 4, 5]
```

## 23.6 张量减法

```matnn
Console.log("\n--- 张量减法 ---");
var tSub = Tensor.sub(t1, t4);
Console.log("t1 - t4:", tSub.data);
```

**输出结果**：

```
t1 - t4: [0, 1, 2, 3]
```

## 23.7 张量乘法

```matnn
Console.log("\n--- 张量乘法 ---");
var tMul = Tensor.mul(t1, t4);
Console.log("t1 * t4:", tMul.data);
```

**输出结果**：

```
t1 * t4: [1, 2, 3, 4]
```

## 23.8 矩阵乘法

```matnn
Console.log("\n--- 矩阵乘法 ---");
var t5 = new Tensor([[1, 2], [3, 4]]);
var t6 = new Tensor([[5, 6], [7, 8]]);
var tMatMul = Tensor.matMul(t5, t6);
Console.log("t5 × t6:", tMatMul.data);
```

**输出结果**：

```
t5 × t6: [[19, 22], [43, 50]]
```

## 23.9 张量转置

```matnn
Console.log("\n--- 张量转置 ---");
var tTranspose = Tensor.transpose(t2);
Console.log("transpose(t2):", tTranspose.data);
```

**输出结果**：

```
transpose(t2): [[1, 3], [2, 4]]
```

## 23.10 张量求和

```matnn
Console.log("\n--- 张量求和 ---");
var sumAll = Tensor.sum(t1);
var sumAxis0 = Tensor.sum(t2, 0);
var sumAxis1 = Tensor.sum(t2, 1);
Console.log("sum(t1):", sumAll);
Console.log("sum(t2, 0):", sumAxis0.data);
Console.log("sum(t2, 1):", sumAxis1.data);
```

**输出结果**：

```
sum(t1): 10
sum(t2, 0): [4, 6]
sum(t2, 1): [3, 7]
```

## 23.11 张量均值

```matnn
Console.log("\n--- 张量均值 ---");
var meanAll = Tensor.mean(t1);
var meanAxis0 = Tensor.mean(t2, 0);
Console.log("mean(t1):", meanAll);
Console.log("mean(t2, 0):", meanAxis0.data);
```

**输出结果**：

```
mean(t1): 2.5
mean(t2, 0): [2, 3]
```

## 23.12 张量重塑

```matnn
Console.log("\n--- 张量重塑 ---");
var tReshape = Tensor.reshape(t1, [2, 2]);
Console.log("reshape(t1, [2, 2]):", tReshape.data);
```

**输出结果**：

```
reshape(t1, [2, 2]): [[1, 2], [3, 4]]
```

## 23.13 张量切片

```matnn
Console.log("\n--- 张量切片 ---");
var tSlice = Tensor.slice(t1, 1, 3);
Console.log("slice(t1, 1, 3):", tSlice.data);
```

**输出结果**：

```
slice(t1, 1, 3): [2, 3]
```

## 23.14 创建全零张量

```matnn
Console.log("\n--- 创建全零张量 ---");
var tZero = Tensor.zeros([2, 3]);
Console.log("zeros([2, 3]):", tZero.data);
```

**输出结果**：

```
zeros([2, 3]): [[0, 0, 0], [0, 0, 0]]
```

## 23.15 创建全一张量

```matnn
Console.log("\n--- 创建全一张量 ---");
var tOnes = Tensor.ones([2, 3]);
Console.log("ones([2, 3]):", tOnes.data);
```

**输出结果**：

```
ones([2, 3]): [[1, 1, 1], [1, 1, 1]]
```

## 23.16 创建随机张量

```matnn
Console.log("\n--- 创建随机张量 ---");
var tRandom = Tensor.random([2, 3]);
Console.log("random([2, 3]):", tRandom.data);
```

**输出结果**：

```
random([2, 3]): [[0.123, 0.456, 0.789], [0.321, 0.654, 0.987]]
```

## 23.17 创建单位矩阵

```matnn
Console.log("\n--- 创建单位矩阵 ---");
var tEye = Tensor.eye(3);
Console.log("eye(3):", tEye.data);
```

**输出结果**：

```
eye(3): [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
```

## 23.18 本章小结

本章介绍了 Matnn 的 Tensor 张量功能：

- **创建张量**：
  - `new Tensor(data)` 创建张量
  - `Tensor.zeros(shape)` 创建全零张量
  - `Tensor.ones(shape)` 创建全一张量
  - `Tensor.random(shape)` 创建随机张量
  - `Tensor.eye(n)` 创建单位矩阵

- **基本运算**：
  - `Tensor.add(t1, t2)` 张量加法
  - `Tensor.sub(t1, t2)` 张量减法
  - `Tensor.mul(t1, t2)` 张量乘法
  - `Tensor.matMul(t1, t2)` 矩阵乘法

- **操作**：
  - `Tensor.transpose(t)` 张量转置
  - `Tensor.sum(t, axis)` 张量求和
  - `Tensor.mean(t, axis)` 张量均值
  - `Tensor.reshape(t, shape)` 张量重塑
  - `Tensor.slice(t, start, end)` 张量切片

## 附录：完整编程指南索引

Matnn 编程指南共包含 23 章，从基础到高级逐步介绍：

1. **简介与入门** - Matnn 概述、编译管道、Hello World
2. **变量与数据类型** - var/let、类型转换
3. **运算符** - 算术、比较、逻辑、赋值
4. **字符串** - 操作、方法、模板字符串
5. **数组** - 操作、方法、遍历
6. **对象** - 对象字面量、属性、方法
7. **函数** - 声明、表达式、箭头函数、call/apply/bind
8. **控制流程** - if-else、循环、switch、break/continue
9. **Console与类型检测** - Console 方法、typeof、instanceof
10. **Math数学对象** - 常量、方法
11. **异常处理** - try-catch-finally、Error 对象
12. **类与继承** - class、constructor、extends、super、static
13. **模块系统** - export/import
14. **异步任务** - Task 对象、run/start/wait
15. **HTTP网络请求** - Http 对象、GET/POST/PUT/DELETE
16. **Date日期时间** - Date 对象、时间戳、日期组件
17. **JSON处理** - JSON.stringify、JSON.parse
18. **文件系统** - Fs 对象、文件读写、目录操作
19. **正则表达式** - RegExp 对象、test/exec、标志
20. **Map与Set** - Map、Set 的使用
21. **加密模块** - Crypto 对象、MD5、Base64、AES、RSA
22. **3D数学** - Vec 向量、Mat 矩阵
23. **Tensor张量** - Tensor 对象、张量运算

## 学习建议

1. **循序渐进**：按照章节顺序学习，从基础到高级
2. **实践操作**：运行示例代码，观察输出结果
3. **参考示例**：查看 `matnn_example/example` 目录下的示例文件
4. **查阅符号表**：参考 `asset/symbol.json` 了解系统符号
5. **调试测试**：使用 Console.log 调试代码
6. **项目实践**：尝试使用 Matnn 编写实际项目

祝您学习愉快！