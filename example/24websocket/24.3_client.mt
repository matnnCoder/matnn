// 24.3 WebSocket 聊天室客户端（事件驱动版 - 线程安全）
// 架构：
//   ┌──────────────────────────────────────────────────┐
//   │ VM 主线程 (VMManager 事件循环)                     │
//   │   ├─ vm->tick() 自动处理 WsClient 事件队列         │
//   │   ├─ 触发 onOpen / onMessage / onClose 回调       │
//   │   ├─ processPendingRequests() 处理 Task.post     │
//   │   │   └─ 调用 bind 的 send/close 回调 → 主线程操作  │
//   │   └─ 检测 hasActiveClients() 保持运行             │
//   ─────────────────────────────────────────────────── │
//   │ 后台线程 (TaskRunner)                             │
//   │   └─ 阻塞读取 stdin → Task.post("send", msg)      │
//   │      注意：Console.input() 必须在后台线程调用        │
//   │      client 永远不在后台线程中操作，全部通过 post     │
//   └──────────────────────────────────────────────────┘
//
// 设计要点：
//   1. Task.bind() 将主线程回调绑定到方法名
//   2. Task.post() 从后台线程投递请求到主线程
//   3. 主线程 processPendingRequests() 调用绑定的回调
//   4. 彻底避免跨线程操作 WsClient 对象

var client = new WsClient();
var inputTask = null;
var running = true;

// 连接成功回调（主线程触发）
client.onOpen = function() {
    Console.log("已连接到聊天室");
    Console.log("输入消息进行聊天，输入 exit 退出");
    Console.log("");

    // 连接成功后再启动后台输入任务，保证 client 已就绪
    // 输入任务在后台线程阻塞读取 stdin，通过 Task.post 投递到主线程
    startInputTask();
};

// 收到服务器消息回调（主线程触发）
client.onMessage = function(message) {
    Console.log(message);
};

// 连接关闭回调（主线程触发）
client.onClose = function() {
    Console.log("连接已关闭");
    // 清理后台输入任务
    if (inputTask) {
        inputTask.cancel();
        inputTask = null;
    }
    running = false;
    Console.log("客户端已退出");
};

// 错误回调（主线程触发）
client.onError = function(error) {
    Console.log("错误: " + error);
};

// 启动后台输入任务
// 核心原则：后台线程只做阻塞 IO (Console.input)
// 所有 WsClient 操作通过 Task.post 投递到主线程
function startInputTask() {
    inputTask = Task.new(function() {
        while (true) {
            var msg = Console.input("请输入> ");
            
            // 分开检查 exit 和 quit，避免 || 短路求值问题
            var isExit = false;
            if (msg === "exit") {
                isExit = true;
            }
            if (msg === "quit") {
                isExit = true;
            }
            
            if (isExit) {
                Task.post("close");
                break;
            }
            if (msg == null || msg.length == 0) {
                // EOF or empty input, stop the task
                break;
            }
            Task.post("send", msg);
        }
    });

    inputTask.bind("send", function(msg) {
        client.send(msg);
    });

    inputTask.bind("close", function() {
        client.close();
    });

    inputTask.start();
}

// === 启动连接 ===
Console.log("正在连接到 ws://127.0.0.1:8084 ...");

// client.connect() 返回 TaskHandle，通过 Task.wait 等待完成并同步状态
var connectHandler = client.connect("ws://127.0.0.1:8084");
Task.wait(connectHandler);

if (!connectHandler.ok) {
    Console.log("连接失败: " + connectHandler.msg);
    Console.log("客户端已退出");
} else {
    // 连接成功，onOpen 回调已触发，启动了后台输入任务
    // 主线程保活循环：Task.sleep 内部会调用 vm->tick() 处理 WebSocket 事件
    // 同时 processPendingRequests() 处理后台 Task.post 投递的请求
    while (running) {
        Task.sleep(100);
    }
}

