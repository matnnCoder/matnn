Console.log("=== 模拟 WebSocket Client Task 流程 ===");

var task = Task.new(function() {
    Console.log("  [后台线程] Task 函数开始执行");
    var msg = Console.input("> ");
    Console.log("  [后台线程] 读取到输入:", msg);
    Task.post("send", msg);
    Console.log("  [后台线程] Task.post 已调用");
});

task.bind("send", function(msg) {
    Console.log("[主线程] 收到回调:", msg);
});

Console.log("启动 Task...");
task.start();
Console.log("Task 已启动，进入 sleep 循环...");

while (true) {
    Task.sleep(100);
}

Console.log("退出");