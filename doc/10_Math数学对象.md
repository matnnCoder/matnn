# 第10章：Math数学对象

## 10.1 Math 对象概述

`Math` 对象提供了一系列数学常量和方法，用于执行数学运算。

### 数学常量

```matnn
Console.log("Math.PI:", Math.PI);
Console.log("Math.E:", Math.E);
Console.log("Math.LN2:", Math.LN2);
Console.log("Math.LN10:", Math.LN10);
Console.log("Math.SQRT2:", Math.SQRT2);
```

**输出结果**：

```
Math.PI: 3.141592653589793
Math.E: 2.718281828459045
Math.LN2: 0.6931471805599453
Math.LN10: 2.302585092994046
Math.SQRT2: 1.4142135623730951
```

## 10.2 基本运算

### abs()

计算绝对值：

```matnn
Console.log("Math.abs(-10):", Math.abs(-10));
Console.log("Math.abs(10):", Math.abs(10));
```

**输出结果**：

```
Math.abs(-10): 10
Math.abs(10): 10
```

### floor()、ceil()、round()、trunc()

```matnn
Console.log("Math.floor(3.9):", Math.floor(3.9));
Console.log("Math.ceil(3.1):", Math.ceil(3.1));
Console.log("Math.round(3.5):", Math.round(3.5));
Console.log("Math.trunc(3.9):", Math.trunc(3.9));
```

**输出结果**：

```
Math.floor(3.9): 3
Math.ceil(3.1): 4
Math.round(3.5): 4
Math.trunc(3.9): 3
```

## 10.3 幂运算

```matnn
Console.log("Math.pow(2, 10):", Math.pow(2, 10));
Console.log("Math.sqrt(16):", Math.sqrt(16));
Console.log("Math.cbrt(27):", Math.cbrt(27));
Console.log("Math.exp(1):", Math.exp(1));
```

**输出结果**：

```
Math.pow(2, 10): 1024
Math.sqrt(16): 4
Math.cbrt(27): 3
Math.exp(1): 2.718281828459045
```

## 10.4 对数运算

```matnn
Console.log("Math.log(Math.E):", Math.log(Math.E));
Console.log("Math.log10(100):", Math.log10(100));
Console.log("Math.log2(8):", Math.log2(8));
```

**输出结果**：

```
Math.log(Math.E): 1
Math.log10(100): 2
Math.log2(8): 3
```

## 10.5 三角函数

```matnn
Console.log("Math.sin(Math.PI/2):", Math.sin(Math.PI/2));
Console.log("Math.cos(Math.PI):", Math.cos(Math.PI));
Console.log("Math.tan(0):", Math.tan(0));
Console.log("Math.asin(1):", Math.asin(1));
Console.log("Math.acos(0):", Math.acos(0));
```

**输出结果**：

```
Math.sin(Math.PI/2): 1
Math.cos(Math.PI): -1
Math.tan(0): 0
Math.asin(1): 1.5707963267948966
Math.acos(0): 1.5707963267948966
```

## 10.6 最大值和最小值

```matnn
Console.log("Math.max(1, 3, 2, 5, 4):", Math.max(1, 3, 2, 5, 4));
Console.log("Math.min(1, 3, 2, 5, 4):", Math.min(1, 3, 2, 5, 4));
```

**输出结果**：

```
Math.max(1, 3, 2, 5, 4): 5
Math.min(1, 3, 2, 5, 4): 1
```

## 10.7 随机数

```matnn
Console.log("Math.random():", Math.random());
Console.log("Math.random():", Math.random());
```

**输出结果**：

```
Math.random(): 0.123456789
Math.random(): 0.987654321
```

## 10.8 符号函数

```matnn
Console.log("Math.sign(10):", Math.sign(10));
Console.log("Math.sign(-10):", Math.sign(-10));
Console.log("Math.sign(0):", Math.sign(0));
```

**输出结果**：

```
Math.sign(10): 1
Math.sign(-10): -1
Math.sign(0): 0
```

## 10.9 本章小结

本章介绍了 Matnn 的 Math 对象：

- 数学常量：PI、E、LN2、LN10、SQRT2
- 基本运算：abs、floor、ceil、round、trunc
- 幂运算：pow、sqrt、cbrt、exp
- 对数运算：log、log10、log2
- 三角函数：sin、cos、tan、asin、acos
- 最大值和最小值：max、min
- 随机数：random
- 符号函数：sign

下一章将介绍异常处理。