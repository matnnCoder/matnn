Console.log("=== 并行任务 ===");

let task1To100 = Task.new(() => {
    let sum = 0;
    for (let i = 1; i <= 100; i++) sum += i;
    return sum;
});
let task101To200 = Task.new(() => {
    let sum = 0;
    for (let i = 101; i <= 200; i++) sum += i;
    return sum;
});
let task201To300 = Task.new(() => {
    let sum = 0;
    for (let i = 201; i <= 300; i++) sum += i;
    return sum;
});

task1To100.start();
task101To200.start();
task201To300.start();
Console.log("三个任务已并行启动");

Task.wait(task1To100, task101To200, task201To300);
Console.log("任务1结果:", task1To100.data);
Console.log("任务2结果:", task101To200.data);
Console.log("任务3结果:", task201To300.data);
Console.log("总和:", task1To100.data + task101To200.data + task201To300.data);
