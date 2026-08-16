Console.log("=== WebSocket 客户端非交互测试 ===");
Console.log("");

var client = new WsClient();

var openFired = false;
var messageReceived = false;
var closeFired = false;
var errorFired = false;

client.onOpen = function() {
    Console.log("[onOpen] 回调触发");
    openFired = true;
};

client.onMessage = function(message) {
    Console.log("[onMessage] 收到: " + message);
    messageReceived = true;
};

client.onClose = function() {
    Console.log("[onClose] 回调触发");
    closeFired = true;
};

client.onError = function(error) {
    Console.log("[onError] 错误: " + error);
    errorFired = true;
};

Console.log("正在连接到 ws://127.0.0.1:8021 ...");

var connectHandler = client.connect("ws://127.0.0.1:8021");
Task.wait(connectHandler);

Console.log("");
Console.log("连接结果: ok=" + connectHandler.ok + " msg=" + connectHandler.msg);

if (connectHandler.ok) {
    Console.log("连接成功，等待 onOpen 触发...");
    
    var waitCount = 0;
    while (!openFired && waitCount < 50) {
        Task.sleep(100);
        waitCount++;
    }
    
    Console.log("onOpen 触发: " + openFired + " (等待了 " + waitCount + " 次)");
    Console.log("onMessage 触发: " + messageReceived);
    
    if (openFired) {
        Console.log("测试 Task.post 机制...");
        
        var testTask = Task.new(function() {
            Console.log("  [后台线程] 测试 Task.post");
            Task.post("testCallback", "hello from background");
            Console.log("  [后台线程] Task.post 已调用");
        });
        
        var callbackReceived = false;
        testTask.bind("testCallback", function(msg) {
            Console.log("[主线程] 收到回调: " + msg);
            callbackReceived = true;
        });
        
        testTask.start();
        
        var postWait = 0;
        while (!callbackReceived && postWait < 30) {
            Task.sleep(100);
            postWait++;
        }
        
        Console.log("Task.post 回调触发: " + callbackReceived + " (等待了 " + postWait + " 次)");
        
        testTask.cancel();
    }
    
    Console.log("关闭连接...");
    client.close();
    
    waitCount = 0;
    while (!closeFired && waitCount < 20) {
        Task.sleep(100);
        waitCount++;
    }
} else {
    Console.log("连接失败，退出");
}

Console.log("");
Console.log("=== 测试完成 ===");
Console.log("onOpen: " + openFired);
Console.log("onMessage: " + messageReceived);
Console.log("onClose: " + closeFired);
Console.log("onError: " + errorFired);