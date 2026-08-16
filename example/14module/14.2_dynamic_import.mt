// 异步模块导入测试
// Module.import(name, path) 返回 TaskHandle，编译在后台线程执行
// Task.wait(handler) 等待完成，handler.data 为模块对象

Console.log("===== 异步模块导入测试 =====");

// 1. 异步导入：var handler = Module.import("hot", "./hot_module.mt")
var handler = Module.import("hot", "./hot_module.mt");
Console.log("[1] import 已提交, handler.code:", handler.code, "handler.done:", handler.done);

// 2. 等待编译完成
Task.wait(handler);
Console.log("[2] wait 完成, handler.code:", handler.code, "handler.msg:", handler.msg);

// 3. 获取模块数据
if (handler.code == 0) {
    var m = handler.data;
    Console.log("[3] 模块加载成功");
    Console.log("[4] m.VERSION:", m.VERSION);
    Console.log("[5] m.greet('matnn'):", m.greet("matnn"));
    Console.log("[6] m.calc(10, 20):", m.calc(10, 20));
    Console.log("[7] m.calc(1, 2):", m.calc(1, 2));
} else {
    Console.log("[ERROR] 模块加载失败:", handler.msg);
}

// 4. 通过 Module.get 获取已加载模块（不区分静态/动态导入）
var m2 = Module.get("hot");
Console.log("[8] Module.get('hot').VERSION:", m2.VERSION);
Console.log("[9] Module.get('hot').greet('world'):", m2.greet("world"));

// 5. 二次导入同模块（已加载，同步返回成功）
var handler2 = Module.import("hot", "./hot_module.mt");
Task.wait(handler2);
Console.log("[10] 二次导入 handler2.code:", handler2.code, "handler2.msg:", handler2.msg);

Console.log("===== 异步导入测试完成 =====");
