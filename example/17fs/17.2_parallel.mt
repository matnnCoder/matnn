Console.log("=== Fs 天然并行 + Task.wait ===");

var testFile = "./test_async_fs.txt";

Console.log("\n--- 1. 写入文件 ---");
var writeHandler = Fs.writeFile(testFile, "Hello, Async Fs!");
Task.wait(writeHandler);
Console.log("写入完成, code:", writeHandler.code);

Console.log("\n--- 2. 读取文件 ---");
var readHandler = Fs.readFile(testFile);
Task.wait(readHandler);
Console.log("读取完成, code:", readHandler.code);
Console.log("文件内容:", readHandler.data);

Console.log("\n--- 3. 追加写入后读取 ---");
var appendHandler = Fs.appendFile(testFile, "\n追加内容");
Task.wait(appendHandler);

var read2Handler = Fs.readFile(testFile);
Task.wait(read2Handler);
Console.log("追加后内容:", read2Handler.data);

Console.log("\n--- 4. 并行操作 ---");
var w1 = Fs.writeFile(testFile, "并发写入");
var r1 = Fs.readFile(testFile);
Task.wait(w1);
Task.wait(r1);
Console.log("并行写入完成, code:", w1.code);
Console.log("并行读取完成, code:", r1.code);

Console.log("\n--- 5. 获取文件信息 ---");
var statHandler = Fs.stat(testFile);
Task.wait(statHandler);
Console.log("stat code:", statHandler.code);

Console.log("\n--- 6. 清理 ---");
var removeHandler = Fs.remove(testFile);
Task.wait(removeHandler);
Console.log("删除完成, code:", removeHandler.code);
