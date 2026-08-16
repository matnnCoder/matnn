Console.log("start");

var handler = Module.import("test", "./hot_module.mt");
Console.log("handler created, code:", handler.code);

// 用最简单的方式等待
Task.wait(handler);
Console.log("wait done, code:", handler.code, "msg:", handler.msg);
