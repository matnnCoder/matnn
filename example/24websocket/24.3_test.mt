// 24.3 非交互测试版本 - 验证 onOpen 回调和 post 机制
var client = new WsClient();
var inputTask = null;
var running = true;

var onOpenFired = false;
var onMessageFired = false;
var onCloseFired = false;
var receivedMessage = "";
var postResult = "";

// 连接成功回调
client.onOpen = function() {
    Console.log("[onOpen] 已连接到聊天室");
    Console.log("[onOpen] 输入消息进行聊天");
    Console.log("[onOpen] 启动后台任务");
    
    onOpenFired = true;
    
    // 测试 Task.post 机制
    var testTask = Task.new(function() {
        Console.log("[后台] 启动");
        Task.post("testPost", "hello from background");
        Console.log("[后台] 退出");
    });
    
    testTask.bind("testPost", function(msg) {
        Console.log("[主线程] 收到 post: " + msg);
        postResult = msg;
    });
    
    testTask.start();
    Console.log("[onOpen] testTask 已启动");
    
    // 启动输入任务
    startInputTask();
};

// 收到服务器消息回调
client.onMessage = function(message) {
    Console.log("[onMessage] " + message);
    onMessageFired = true;
    receivedMessage = message;
};

// 连接关闭回调
client.onClose = function() {
    Console.log("[onClose] 连接已关闭");
    onCloseFired = true;
    if (inputTask) {
        inputTask.cancel();
        inputTask = null;
    }
    running = false;
};

// 错误回调
client.onError = function(error) {
    Console.log("[onError] " + error);
};

// 启动后台输入任务
function startInputTask() {
    Console.log("[startInputTask] 创建输入任务");
    inputTask = Task.new(function() {
        var msg = "hello world";  // 自动发送一条消息而不是等待输入
        Console.log("[后台] 准备发送: " + msg);
        Task.post("send", msg);
        Task.post("close");
    });

    inputTask.bind("send", function(msg) {
        Console.log("[主线程] send: " + msg);
        client.send(msg);
    });

    inputTask.bind("close", function() {
        Console.log("[主线程] close");
        client.close();
    });

    inputTask.start();
    Console.log("[startInputTask] 输入任务已启动");
}

// === 启动连接 ===
Console.log("正在连接到 ws://127.0.0.1:8021 ...");

var connectHandler = client.connect("ws://127.0.0.1:8021");
Task.wait(connectHandler);

Console.log("连接完成: ok=" + connectHandler.ok);
Console.log("onOpenFired=" + onOpenFired);

// 等待一些时间让消息交换
var waitCount = 0;
while (running && waitCount < 30) {
    Task.sleep(100);
    waitCount++;
    if (waitCount % 5 == 0) {
        Console.log("[等待中] " + waitCount + " onOpen=" + onOpenFired + " onMessage=" + onMessageFired + " postResult=" + postResult);
    }
}

Console.log("=== 最终状态 ===");
Console.log("onOpenFired=" + onOpenFired);
Console.log("onMessageFired=" + onMessageFired);
Console.log("onCloseFired=" + onCloseFired);
Console.log("receivedMessage=" + receivedMessage);
Console.log("postResult=" + postResult);

if (onOpenFired) {
    Console.log("onOpen 回调机制正常!");
} else {
    Console.log("onOpen 回调未触发!");
}

if (postResult == "hello from background") {
    Console.log("Task.post 机制正常!");
} else {
    Console.log("Task.post 机制异常!");
}

Console.log("=== 测试结束 ===");
