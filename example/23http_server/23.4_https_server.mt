// 23.4 HTTPS 服务器示例
// 演示如何启用 HTTPS（基于自签名证书）
//
// 运行前请确保 cert/cert.pem 和 cert/key.pem 已生成
// （可使用 _gen_cert.exe 生成，或参考根目录 _gen_cert.cpp 自行编译）
//
// 浏览器访问时由于是自签名证书，需要手动信任：
//   https://127.0.0.1:8443/api/hello

Console.log("=== HTTPS 服务器 ===");

// 创建 HTTP 服务器
var server = new HttpServer();
Console.log("服务器创建:", server);

// 加载自签名证书（必须在 start 之前调用）
var certPath = "cert/cert.pem";
var keyPath  = "cert/key.pem";
var sslOk = server.useSsl(certPath, keyPath);
Console.log("启用 SSL:", sslOk);
Console.log("SSL 状态:", server.ssl);

if (!sslOk) {
    Console.log("证书加载失败，请检查 cert/cert.pem 和 cert/key.pem 是否存在");
    Console.log("可使用根目录 _gen_cert.exe 生成：");
    Console.log("  _gen_cert.exe cert/cert.pem cert/key.pem localhost");
} else {
    // 设置回调事件
    server.onStart = function() {
        Console.log("HTTPS 服务器已启动");
    };

    server.onRequest = function(req, res) {
        Console.log("收到请求:", req.method, req.url);
    };

    server.onClose = function() {
        Console.log("HTTPS 服务器已关闭");
    };

    server.onError = function(error) {
        Console.log("服务器错误:", error);
    };

    // 添加 GET 路由
    server.get("/api/hello", function(req, res) {
        Console.log("远程地址:", req.remoteAddr);
        res.status(200);
        res.header("Content-Type", "application/json");
        res.send('{"message":"Hello, HTTPS!"}');
    });

    server.get("/api/test", function(req, res) {
        res.status(200);
        res.header("Content-Type", "application/json");
        res.send('{"message":"Hello, test!"}');
    });

    // 添加 POST 路由
    server.post("/api/data", function(req, res) {
        Console.log("请求体:", req.body);
        res.status(201);
        res.send('{"status":"created"}');
    });

    // 启动服务器（返回任务句柄）
    Console.log("\n=== 启动 HTTPS 服务器 ===");
    var startHandler = server.start(8443, "127.0.0.1");
    Console.log("启动句柄 code:", startHandler.code);

    // 串行等待服务器真正就绪
    Task.wait(startHandler);
    Console.log("启动完成 code:", startHandler.code);
    Console.log("启动完成 msg:", startHandler.msg);

    // 验证服务器状态
    Console.log("服务器状态:", server.running);
    Console.log("服务器端口:", server.port);
    Console.log("服务器URL:", server.url);
    Console.log("API访问地址:", server.url + "/api/hello");

    Console.log("\n=== HTTPS 服务器继续监听中... ===");
    Console.log("提示：浏览器访问 https://127.0.0.1:8443/api/hello 需手动信任证书");

    // 后台任务处理终端输入
    var inputTask = Task.new(function() {
        while (true) {
            var cmd = Console.input();
            if (cmd === "exit") {
                break;
            }
            Console.log("收到命令：", cmd);
        }
    });
    inputTask.start();

    Task.wait(inputTask);

    // 优雅关闭
    var closeTask = server.close();
    Task.wait(closeTask);
    Console.log("HTTPS 服务正常退出");
}
