Console.log("=== HTTP 服务器静态文件服务测试 ===");

// 创建 HTTP 服务器
let server = new HttpServer();

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


// 添加 API 路由
server.get("/api/hello", function(req, res) {
    res.status(200);
    res.header("Content-Type", "application/json");
    res.send('{"message":"Hello, API!"}');
});

// 注册静态路由 - 使用相对路径（以入口文件所在目录为基准）
Console.log("注册静态路由: /public -> ./public");
// server.static(路由前缀, 静态资源目录, 默认首页文件名, 是否支持子目录列表浏览)
server.static("/public", "./public", "index.html", false);

Console.log("注册静态路由: /static -> ./static");
// server.static(路由前缀, 静态资源目录, 默认首页文件名, 是否支持子目录列表浏览)
server.static("/static", "./static", "index.html", false);

// 设置自定义 MIME 类型
server.setMime("xyz", "application/xyz");
server.setMime("md", "text/markdown; charset=utf-8");

// 启动服务器
Console.log("启动服务器...");
let startTask = server.start(8082, "127.0.0.1");
Task.wait(startTask);
Console.log("启动完成 code:", startTask.code);
Console.log("服务器已启动！");
Console.log("  API:    http://127.0.0.1:8082/api/hello");
Console.log("  静态:   http://127.0.0.1:8082/public/index.html");
Console.log("  静态:   http://127.0.0.1:8082/static/style.css");
Console.log("  静态:   http://127.0.0.1:8082/static/script.js");
Console.log("");
Console.log("输入 exit 退出服务器...");

// 后台任务处理终端输入
let inputTask = Task.new(()=>{
    while(true){
        let cmd = Console.input();
        if(cmd === "exit"){
            break;
        }
        if(cmd !== "" && cmd.length > 0){
            Console.log("收到命令：", cmd);
        }
    }
});
inputTask.start();

Task.wait(inputTask);

// 开始优雅关闭
let closeTask = server.close();
Task.wait(closeTask);
Console.log("服务正常退出");
