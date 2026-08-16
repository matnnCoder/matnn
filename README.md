# Matnn 编程指南

Matnn 是一个轻量级的脚本编程语言。

## 目录结构

| 章节 | 文件名 | 内容概述 |
|------|--------|----------|
| 第1章 | [01_简介与入门.md](doc/01_简介与入门.md) | Matnn 概述、Hello World |
| 第2章 | [02_变量与数据类型.md](doc/02_变量与数据类型.md) | var/let、类型转换 |
| 第3章 | [03_运算符.md](doc/03_运算符.md) | 算术、比较、逻辑、赋值运算符 |
| 第4章 | [04_字符串.md](doc/04_字符串.md) | 字符串操作、方法、模板字符串 |
| 第5章 | [05_数组.md](doc/05_数组.md) | 数组操作、方法、遍历 |
| 第6章 | [06_对象.md](doc/06_对象.md) | 对象字面量、属性、方法 |
| 第7章 | [07_函数.md](doc/07_函数.md) | 函数声明、表达式、箭头函数、call/apply/bind |
| 第8章 | [08_控制流程.md](doc/08_控制流程.md) | if-else、循环、switch、break/continue |
| 第9章 | [09_Console与类型检测.md](doc/09_Console与类型检测.md) | Console 方法、typeof、instanceof |
| 第10章 | [10_Math数学对象.md](doc/10_Math数学对象.md) | Math 常量和方法 |
| 第11章 | [11_异常处理.md](doc/11_异常处理.md) | try-catch-finally、Error 对象 |
| 第12章 | [12_类与继承.md](doc/12_类与继承.md) | class、constructor、extends、super、static |
| 第13章 | [13_模块系统.md](doc/13_模块系统.md) | export/import 模块化 |
| 第14章 | [14_异步任务.md](doc/14_异步任务.md) | Task 对象、run/start/wait |
| 第15章 | [15_HTTP网络请求.md](doc/15_HTTP网络请求.md) | Http 对象、GET/POST/PUT/DELETE |
| 第16章 | [16_Date日期时间.md](doc/16_Date日期时间.md) | Date 对象、时间戳、日期组件 |
| 第17章 | [17_JSON处理.md](doc/17_JSON处理.md) | JSON.stringify、JSON.parse |
| 第18章 | [18_文件系统.md](doc/18_文件系统.md) | Fs 对象、文件读写、目录操作 |
| 第19章 | [19_正则表达式.md](doc/19_正则表达式.md) | RegExp 对象、test/exec、标志 |
| 第20章 | [20_Map与Set.md](doc/20_Map与Set.md) | Map、Set 的使用 |
| 第21章 | [21_加密模块.md](doc/21_加密模块.md) | Crypto 对象、MD5、Base64、AES、RSA |
| 第22章 | [22_3D数学.md](doc/22_3D数学.md) | Vec 向量、Mat 矩阵 |
| 第23章 | [23_Tensor张量.md](doc/23_Tensor张量.md) | Tensor 对象、张量运算 |

## 学习路线

### 基础篇（第1-9章）
- 了解 Matnn 语言概述和编译管道
- 掌握变量声明和数据类型
- 熟悉运算符和表达式
- 学习字符串、数组、对象的基本操作
- 掌握函数定义和调用
- 理解控制流程语句
- 使用 Console 调试和类型检测

### 进阶篇（第10-13章）
- 使用 Math 对象进行数学计算
- 掌握异常处理机制
- 学习类和继承
- 使用模块系统组织代码

### 高级篇（第14-23章）
- 异步任务处理
- HTTP 网络请求
- Date 日期时间
- JSON 数据处理
- 文件系统操作
- 正则表达式
- Map 与 Set
- 加密模块
- 3D 数学（向量、矩阵）
- Tensor 张量运算

## 参考资源

- **示例代码**：`./example/` 目录下包含各种示例文件
- **参考指南**：`./doc/` 目录下包含各种示例文件
- **vsCode插件**：`./vscode_plugin/` 目录下包含vsCode语法高亮插件


## 数据类型

Matnn 支持以下数据类型：

- `number` - 数值类型
- `string` - 字符串类型
- `boolean` - 布尔类型
- `null` - 空值类型
- `array` - 数组类型
- `object` - 对象类型
- `function` - 函数类型

## 内置对象

Matnn 提供了丰富的内置对象：

- **基础对象**：Console、Math、Date、JSON
- **集合对象**：Array、Map、Set
- **网络对象**：Http
- **文件对象**：Fs
- **加密对象**：Crypto
- **3D 数学**：Vec、Mat
- **张量对象**：Tensor
- **异步任务**：Task
- **正则表达式**：RegExp

## 语法特点

Matnn 的语法类似于 JavaScript，具有以下特点：

- 使用 `var` 或 `let` 声明变量
- 使用 `function` 或箭头函数 `=>` 定义函数
- 使用 `class` 定义类，支持 `extends` 继承
- 使用 `export`/`import` 实现模块化
- 使用 `try-catch-finally` 处理异常
- 使用 `Task` 对象处理异步任务

## 快速开始

```matnn
Console.log("Hello, Matnn!");

var x = 10;
var y = 20;
Console.log("x + y =", x + y);

function add(a, b) {
    return a + b;
}
Console.log("add(5, 3) =", add(5, 3));
```

运行以上代码，输出：

```
Hello, Matnn!
x + y = 30
add(5, 3) = 8
```

## 学习建议

1. 按照章节顺序学习，从基础到高级
2. 运行每章的示例代码，观察输出结果
3. 修改示例代码，尝试不同的写法
4. 参考 `../example/` 目录下的示例文件
5. 使用 Console.log 调试代码
6. 尝试编写自己的 Matnn 程序

祝您学习愉快！
