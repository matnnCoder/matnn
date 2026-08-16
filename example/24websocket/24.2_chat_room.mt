// 24.2 WebSocket 聊天室服务端（事件驱动版）
// 架构：
//   ┌──────────────────────────────────────────────────┐
//   │ VM 主线程事件循环 (VMManager)                     │
//   │   ├─ vm->tick() 自动处理 WsServer 事件队列       │
//   │   ├─ 触发 onConnect / onMessage / onDisconnect   │
//   │   └─ 检测 hasActiveServers() 保持运行            │
//   ─────────────────────────────────────────────────── │
//   │ 工作线程 (WsServer 内部)                         │
//   │   ├─ 网络 IO: accept / recv / send               │
//   │   └─ 事件入队: fireOnConnect / fireOnMessage...   │
//   └──────────────────────────────────────────────────┘
//
// 设计要点：
//   1. 主脚本仅注册回调 + 启动服务器，然后立即返回
//   2. VMManager 主循环自动检测活跃 WsServer 实例，保持运行
//   3. 所有事件回调自动在主线程触发，无需手动 while 保活
//   4. 服务器关闭后 VM 自动检测无活跃实例并优雅退出

var ws = new WsServer();

var clients = new Map();
var clientIds = [];

ws.onConnect = function(clientId) {
    Console.log("新用户连接: " + clientId);
    var info = new Map();
    info.set("id", clientId);
    info.set("name", "用户_" + clientId.slice(-4));
    info.set("joinTime", Date.now());
    clients.set(clientId, info);
    clientIds.push(clientId);
    
    ws.send(clientId, "欢迎来到聊天室！你的昵称是: " + info.get("name"));
    ws.send(clientId, "当前在线人数: " + ws.getClientCount());
    ws.broadcast("系统消息: " + info.get("name") + " 加入了聊天室");
};

ws.onMessage = function(clientId, message) {
    var client = clients.get(clientId);
    if (!client) return;
    
    var name = client.get("name");
    Console.log(name + ": " + message);
    
    if (message.startsWith("/name ")) {
        var newName = message.substring(6);
        client.set("name", newName);
        ws.send(clientId, "昵称已修改为: " + newName);
        ws.broadcast("系统消息: " + name + " 改名为 " + newName);
        return;
    }
    
    if (message === "/list") {
        var list = "在线用户列表:\n";
        for (var i = 0; i < clientIds.length; i++) {
            var cid = clientIds[i];
            if (clients.has(cid)) {
                list += "  - " + clients.get(cid).get("name") + "\n";
            }
        }
        ws.send(clientId, list);
        return;
    }

    if (message === "/quit" || message === "/exit") {
        ws.send(clientId, "服务器即将关闭...");
        ws.broadcast("服务器已关闭");
        ws.close();
        return;
    }
    
    ws.broadcast(name + ": " + message);
};

ws.onDisconnect = function(clientId) {
    var client = clients.get(clientId);
    if (client) {
        var name = client.get("name");
        Console.log(name + " 离开了聊天室");
        ws.broadcast("系统消息: " + name + " 离开了聊天室");
        clients.delete(clientId);
        var idx = clientIds.indexOf(clientId);
        if (idx >= 0) {
            clientIds.splice(idx, 1);
        }
    } else {
        Console.log("未知用户 " + clientId + " 离开了聊天室");
    }
};

ws.onError = function(error) {
    Console.log("错误: " + error);
};

ws.onStart = function() {
    Console.log("聊天室服务器已启动，端口: 8084");
    Console.log("支持命令: /name <新昵称>, /list, /quit");
};

// 启动服务器 - 主脚本立即返回
// VMManager 主循环自动检测 hasActiveServers() 保持运行
// 服务器关闭后自动检测并优雅退出
Console.log("正在启动聊天室服务器...");
var startHandler = ws.start(8084, "127.0.0.1");
Task.wait(startHandler);

if (!startHandler.ok) {
    Console.log("启动失败: " + startHandler.msg);
}
// 主脚本返回，VMManager 主循环继续运行
// WsServer 事件通过 vm->tick() 自动分发到回调
