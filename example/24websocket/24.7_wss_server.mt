// 24.7 WSS (WebSocket Secure) 服务器示例
// 演示如何启用 WSS（基于自签名证书的加密 WebSocket）
//
// 运行前请确保 cert/cert.pem 和 cert/key.pem 已生成
// （可使用 _gen_cert.exe 生成，或参考根目录 _gen_cert.cpp 自行编译）
//
// 浏览器控制台连接（需先信任自签名证书，可先访问任意 https 页面）：
//   var ws = new WebSocket('wss://127.0.0.1:8444');

var ws = new WsServer();

// 加载自签名证书（必须在 start 之前调用）
var certPath = "cert/cert.pem";
var keyPath  = "cert/key.pem";
var sslOk = ws.useSsl(certPath, keyPath);
Console.log("启用 SSL:", sslOk);
Console.log("SSL 状态:", ws.ssl);

if (!sslOk) {
    Console.log("证书加载失败，请检查 cert/cert.pem 和 cert/key.pem 是否存在");
    Console.log("可使用根目录 _gen_cert.exe 生成：");
    Console.log("  _gen_cert.exe cert/cert.pem cert/key.pem localhost");
} else {
    // 设置连接回调
    ws.onConnect = function(clientId) {
        Console.log("客户端连接: " + clientId);
        Console.log("当前连接数: " + ws.getClientCount());

        // 向新连接的客户端发送欢迎消息
        ws.send(clientId, "欢迎连接到 WSS 服务器!");
    };

    // 设置消息回调
    ws.onMessage = function(clientId, message) {
        Console.log("收到消息 [" + clientId + "]: " + message);

        // 回显消息
        ws.send(clientId, "服务器收到: " + message);

        // 广播给所有客户端
        ws.broadcast("广播 [" + clientId + "]: " + message);
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
        Console.log("WSS 服务器已启动");
        Console.log("端口: " + ws.port);
        Console.log("运行中: " + ws.running);
    };

    // 设置关闭回调
    ws.onClose = function() {
        Console.log("WSS 服务器已关闭");
    };

    Console.log("尝试启动 WSS 服务器...");

    // 启动服务器
    var startHandler = ws.start(8444, "127.0.0.1");

    Console.log("startHandler code: " + startHandler.code);
    Console.log("startHandler msg: " + startHandler.msg);

    Task.wait(startHandler);

    Console.log("After Task.wait:");
    Console.log("startHandler.code: " + startHandler.code);
    Console.log("startHandler.ok: " + startHandler.ok);
    Console.log("startHandler.msg: " + startHandler.msg);
    Console.log("startHandler.isDone: " + startHandler.isDone);
    Console.log("ws.running: " + ws.running);

    if (startHandler.ok) {
        Console.log("WSS 服务器启动成功，端口: 8444");
        Console.log("使用浏览器控制台连接: var ws = new WebSocket('wss://127.0.0.1:8444')");
        Console.log("提示：浏览器需先信任自签名证书（可访问 https://127.0.0.1:8444 触发提示）");
    } else {
        Console.log("WSS 服务器启动失败");
    }

    // 保持服务器运行（通过一个永不结束的任务）
    var keepAlive = Task.new(function() {
        while (ws.running) {
            Task.wait(Task.sleep(1000));
        }
    });
    keepAlive.start();
    Task.wait(keepAlive);
}
