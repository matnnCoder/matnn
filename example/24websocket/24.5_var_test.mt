Console.log("=== 变量可见性测试 ===");

var testVar = false;
var testVar2 = "";

Console.log("初始: testVar=" + testVar);

var client = new WsClient();

client.onOpen = function() {
    Console.log("[onOpen] 修改变量");
    testVar = true;
    testVar2 = "modified";
    Console.log("[onOpen] 修改后: testVar=" + testVar);
};

var connectHandler = client.connect("ws://127.0.0.1:8021");
Task.wait(connectHandler);

Console.log("连接后: testVar=" + testVar + " testVar2=" + testVar2);

Task.sleep(500);

Console.log("等待后: testVar=" + testVar + " testVar2=" + testVar2);

client.close();

Console.log("=== 测试结束 ===");