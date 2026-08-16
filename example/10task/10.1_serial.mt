Console.log("=== 串行等待 (start + wait) ===");

let sumTask = Task.new(() => {
    let sum = 0;
    for (let i = 1; i <= 100; i++) {
        sum += i;
    }
    Console.log("task name is："+Task.getName())
    return sum;
});

sumTask.start();
Task.wait(sumTask);

Console.log("main name is："+Task.getName())
Console.log("任务结果:", sumTask.data);
Console.log("期望结果: 5050");
