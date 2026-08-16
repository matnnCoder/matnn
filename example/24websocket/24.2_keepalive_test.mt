// 简单服务器保活测试
var ws = new WsServer();

ws.onStart = function() {
    Console.log("服务器已启动，端口: 8085");
};

ws.onConnect = function(clientId) {
    Console.log("新用户连接: " + clientId);
};

ws.onMessage = function(clientId, message) {
    Console.log("收到消息: " + message + " 来自 " + clientId);
    ws.send(clientId, "回显: " + message);
};

ws.onDisconnect = function(clientId) {
    Console.log("用户断开: " + clientId);
};

Console.log("启动服务器...");
var handler = ws.start(8085, "127.0.0.1");
Task.wait(handler);

if (!handler.ok) {
    Console.log("启动失败: " + handler.msg);
}

// 脚本完成后，VMManager 主循环应保持运行
// 因为 hasActiveServers() 返回 true
Console.log("主脚本完成，服务器应继续运行...");
Console.log("3秒后检查服务器状态...");
Task.sleep(3000);
Console.log("服务器状态 - running: " + ws.running + ", clientCount: " + ws.clientCount);
