Console.log("=== 模拟嵌套 Task（在回调中创建 Task）===");

var innerTask = null;
var received = false;

var outerTask = Task.new(function() {
    innerTask = Task.new(function() {
        Console.log("  [内层Task] 开始执行");
        var msg = Console.input("> ");
        Console.log("  [内层Task] 读取:", msg);
        Task.post("send", msg);
        Console.log("  [内层Task] post 完成");
    });

    innerTask.bind("send", function(msg) {
        Console.log("[主线程] 收到回调:", msg);
        received = true;
    });

    Console.log("  [外层Task] 启动内层Task...");
    innerTask.start();
    Console.log("  [外层Task] 内层Task已启动");
    return "done";
});

Console.log("启动外层Task...");
outerTask.start();

Console.log("等待外层Task完成...");
Task.wait(outerTask);
Console.log("外层Task完成");

Console.log("进入 sleep 循环...");
while (!received) {
    Task.sleep(100);
}
Console.log("收到消息，退出");