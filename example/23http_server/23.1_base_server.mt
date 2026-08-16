Console.log("=== HTTP 服务器 ===");

// 创建 HTTP 服务器
var server = new HttpServer();
Console.log("服务器创建:", server);

// 添加 GET 路由
server.get("/api/hello", function(req, res) {
    Console.log("远程地址:", req.remoteAddr);
    res.status(200);
    res.header("Content-Type", "application/json");
    res.send('{"message":"Hello, Matnn!"}');
});

// 添加 POST 路由
server.post("/api/data", function(req, res) {
    Console.log("请求体:", req.body);
    res.status(201);
    res.send('{"status":"created"}');
});

// 启动服务器（返回任务句柄）
Console.log("\n=== 启动服务器 ===");
var startHandler = server.start(8080, "127.0.0.1");
Console.log("启动句柄 code:", startHandler.code);

// 串行等待服务器真正就绪
Task.wait(startHandler);
Console.log("启动完成 code:", startHandler.code);
Console.log("启动完成 msg:", startHandler.msg);

// 验证服务器状态
Console.log("服务器状态:", server.running);
Console.log("服务器端口:", server.port);
Console.log("服务器URL:", server.url);

// 测试 HTTP 请求（天然异步 + Task.wait 串行等待）
Console.log("\n=== 测试 HTTP 请求 ===");

var getHandler = Http.get("http://127.0.0.1:8080/api/hello");

Task.wait(getHandler);
Console.log("GET /api/hello code:", getHandler.code);
Console.log("GET /api/hello msg:", getHandler.msg);
Console.log("GET /api/hello data:", getHandler.data);

var postHandler = Http.post("http://127.0.0.1:8080/api/data", {name: "test"});

Task.wait(postHandler);
Console.log("POST /api/data code:", postHandler.code);
Console.log("POST /api/data msg:", postHandler.msg);
Console.log("POST /api/data data:", postHandler.data);

// 并行请求 + 分别等待
Console.log("\n=== 并行请求 + 串行等待 ===");
var p1 = Http.get("http://127.0.0.1:8080/api/hello");
var p2 = Http.get("http://127.0.0.1:8080/api/hello");
Console.log("两个请求已并行启动");
Task.wait(p1);
Console.log("p1 code:", p1.code, "ok:", p1.code >= 200 && p1.code < 300);
Task.wait(p2);
Console.log("p2 code:", p2.code, "ok:", p2.code >= 200 && p2.code < 300);

// 关闭服务器（返回任务句柄）
Console.log("\n=== 关闭服务器 ===");
var closeHandler = server.close();
Console.log("关闭句柄 code:", closeHandler.code);

// 串行等待服务器完全关闭
Task.wait(closeHandler);
Console.log("关闭完成 code:", closeHandler.code);
Console.log("关闭完成 msg:", closeHandler.msg);
Console.log("服务器运行中:", server.running);

Console.log("\n=== 测试完成 ===");
