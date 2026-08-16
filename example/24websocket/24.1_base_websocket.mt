// 24.1 WebSocket 基础示例
// 演示 WebSocket 服务器的基本使用

var ws = new WsServer();

// 设置连接回调
ws.onConnect = function(clientId) {
    Console.log("客户端连接: " + clientId);
    Console.log("当前连接数: " + ws.getClientCount());
    
    // 向新连接的客户端发送欢迎消息
    ws.send(clientId, "欢迎连接到 WebSocket 服务器!");
    
    // 向所有客户端广播
    ws.broadcast("新客户端加入: " + clientId);
};

// 设置消息回调
ws.onMessage = function(clientId, message) {
    Console.log("收到消息 [" + clientId + "]: " + message);
    
    // 回显消息
    ws.send(clientId, "服务器收到: " + message);
};

// 设置断开连接回调
ws.onDisconnect = function(clientId) {
    Console.log("客户端断开: " + clientId);
    Console.log("当前连接数: " + ws.getClientCount());
};

// 设置错误回调
ws.onError = function(error) {
    Console.log("错误: " + error);
};

// 设置启动回调
ws.onStart = function() {
    Console.log("WebSocket 服务器已启动");
    Console.log("端口: " + ws.port);
    Console.log("运行中: " + ws.running);
};

// 设置关闭回调
ws.onClose = function() {
    Console.log("WebSocket 服务器已关闭");
};

Console.log("尝试启动服务器...");

// 启动服务器
var startHandler = ws.start(8083, "127.0.0.1");

Console.log("startHandler type: " + typeof startHandler);
Console.log("startHandler.code: " + startHandler.code);
Console.log("startHandler.ok: " + startHandler.ok);
Console.log("startHandler.msg: " + startHandler.msg);
Console.log("startHandler.isDone: " + startHandler.isDone);
Console.log("ws.running: " + ws.running);

Task.wait(startHandler);

Console.log("After Task.wait:");
Console.log("startHandler.code: " + startHandler.code);
Console.log("startHandler.ok: " + startHandler.ok);
Console.log("startHandler.msg: " + startHandler.msg);
Console.log("startHandler.isDone: " + startHandler.isDone);
Console.log("ws.running: " + ws.running);

if (startHandler.ok) {
    Console.log("服务器启动成功，端口: 8083");
    Console.log("使用浏览器控制台连接: ws = new WebSocket('ws://127.0.0.1:8083')");
} else {
    Console.log("服务器启动失败");
}

// 保持服务器运行（通过一个永不结束的任务）
var keepAlive = Task.new(function() {
    while (ws.running) {
        Task.wait(Task.sleep(1000));
    }
});
keepAlive.start();
Task.wait(keepAlive);
