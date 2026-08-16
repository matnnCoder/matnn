Console.log("=== 并行任务 (天然异步) ===");

var t1 = Task.new(() => {
    var sum = 0;
    for (var i = 1; i <= 100; i++) {
        sum += i;
    }
    Console.log("任务内部结果:", sum);
    return sum;
});

t1.start();
Console.log("start 返回后立即执行，不阻塞");
Task.wait(t1);
Console.log("任务完成，结果:", t1.data);
