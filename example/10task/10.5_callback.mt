Console.log("=== 任务回调机制 ===");

Console.log("\n--- Task.call (串行回调) ---");
let serialCallbackTask = Task.new(() => {
    let result = Task.call("getResult");
    return result;
});
serialCallbackTask.bind("getResult", () => "callback_result");
serialCallbackTask.start();
Task.wait(serialCallbackTask);
Console.log("Task.call 结果:", serialCallbackTask.data);

Console.log("\n--- Task.post (并行回调) ---");
let parallelCallbackTask = Task.new(() => {
    for (let i = 0; i < 5; i++) {
        Task.post("addMessage", "消息" + i);
    }
    return "done";
});
parallelCallbackTask.bind("addMessage", (msg) => {
    Console.log("收到消息:", msg);
});
parallelCallbackTask.start();
Task.wait(parallelCallbackTask);
Console.log("Task.post 结果:", parallelCallbackTask.data);
