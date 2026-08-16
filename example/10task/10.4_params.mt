Console.log("=== 任务参数传递 (put/get) ===");

let paramTask = Task.new(() => {
    let name = Task.get("name");
    let age = Task.get("age");
    let score = Task.get("score");
    Console.log("子任务: name=" + name + ", age=" + age + ", score=" + score);
    return age + score;
});

paramTask.put("name", "张三");
paramTask.put("age", 25);
paramTask.put("score", 95);
paramTask.start();
Task.wait(paramTask);
Console.log("任务结果:", paramTask.data);
