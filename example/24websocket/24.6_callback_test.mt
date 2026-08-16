Console.log("=== 回调可见性详细测试 ===");

var testVar = false;
Console.log("初始: testVar=" + testVar);

var client = new WsClient();

Console.log("设置 onOpen...");
client.onOpen = function() {
    Console.log("[onOpen] 开始执行");
    testVar = true;
    Console.log("[onOpen] testVar 已设为: " + testVar);
    Console.log("[onOpen] 执行结束");
};
Console.log("onOpen 已设置");

Console.log("连接中...");
var connectHandler = client.connect("ws://127.0.0.1:8021");
Console.log("等待连接...");
Task.wait(connectHandler);

Console.log("连接完成: ok=" + connectHandler.ok);
Console.log("当前 testVar=" + testVar);

var waitCount = 0;
while (!testVar && waitCount < 20) {
    Task.sleep(100);
    waitCount++;
    Console.log("  等待中 " + waitCount + " testVar=" + testVar);
}

Console.log("最终: testVar=" + testVar + " waitCount=" + waitCount);

if (testVar) {
    Console.log("回调机制正常!");
} else {
    Console.log("回调机制异常 - testVar 未被修改");
}

client.close();
Console.log("=== 测试结束 ===");
