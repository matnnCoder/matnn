Console.log("=== HTTP 服务器 ===");

// 创建 HTTP 服务器
var server = new HttpServer();
Console.log("服务器创建:", server);

// 设置回调事件
server.onStart = function() {
    Console.log("服务器已启动");
};

server.onRequest = function(req, res) {
    Console.log("收到请求:", req.method, req.url);
};

server.onClose = function() {
    Console.log("服务器已关闭");
};

server.onError = function(error) {
    Console.log("服务器错误:", error);
};

// 添加 GET 路由
server.get("/api/test", function(req, res) {
    Console.log("远程地址:", req.remoteAddr);
    res.status(200);
    res.header("Content-Type", "application/json");
    res.send('{"message":"Hello, test!"}');
});


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
Console.log("api访问地址:", server.url+"/api/hello");
Console.log("api访问地址:", server.url+"/api/test");

Console.log("\n=== Http server继续监听中... ===");
// 后台任务处理终端输入
var inputTask = Task.new(()=>{
    while(true){
        var cmd = Console.input();
        if(cmd === "exit"){
            break;
        }
        Console.log("收到命令：", cmd);
    }
});
inputTask.start();

Task.wait(inputTask);

// 开始优雅关闭
var closeTask = server.close();
Task.wait(closeTask);
Console.log("服务正常退出");
