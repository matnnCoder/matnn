// 最简异步模块导入测试
Console.log("===== simple test =====");

var handler = Module.import("hot", "./hot_module.mt");
Console.log("handler.code:", handler.code);
Console.log("handler.msg:", handler.msg);

Task.wait(handler);
Console.log("after wait, handler.code:", handler.code);
Console.log("handler.msg:", handler.msg);

Console.log("===== done =====");
