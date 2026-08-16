// 静态模块导入测试
// 使用 import 语法在编译期加载模块，对齐 ES Module 行为
// 依赖模块：simple_module.mt、math_module.mt

Console.log("===== 静态模块导入测试 =====");

// 1. 导入基础模块（常量 + 函数）
import "./simple_module.mt" as sm;

Console.log("[1] 常量访问 sm.VALUE:", sm.VALUE);
Console.log("[2] 函数调用 sm.sum(10, 20):", sm.sum(10, 20));
Console.log("[3] 函数调用 sm.sum(1, 2):", sm.sum(1, 2));

// 2. 导入数学模块（验证模块内常量在函数体内的引用）
import "./math_module.mt" as math;

Console.log("[4] 模块常量 math.PI:", math.PI);
Console.log("[5] 常量参与计算 math.calculateArea(2):", math.calculateArea(2));
Console.log("[6] 常量参与计算 math.calculateArea(10):", math.calculateArea(10));

Console.log("===== 静态导入测试完成 =====");
