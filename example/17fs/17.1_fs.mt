Console.log("=== Fs 文件系统操作（天然并行）===");

let testDir = "./test_fs_dir";
let testFile = "./test_fs.txt";

Console.log("\n--- 创建目录 ---");
let mkdirTask = Fs.mkdir(testDir);
Task.wait(mkdirTask);
Console.log("目录", testDir, "创建完成, code:", mkdirTask.code);

Console.log("\n--- 检查目录是否存在 ---");
let existsTask = Fs.exists(testDir);
Task.wait(existsTask);
Console.log("目录", testDir, "存在:", existsTask.data);

Console.log("\n--- 写入文件 ---");
let writeTask = Fs.writeFile(testFile, "Hello, Matnn Fs!");
Task.wait(writeTask);
Console.log("文件", testFile, "写入完成, code:", writeTask.code);

Console.log("\n--- 读取文件 ---");
let readTask = Fs.readFile(testFile);
Task.wait(readTask);
Console.log("文件内容:", readTask.data);

Console.log("\n--- 追加写入文件 ---");
let appendTask = Fs.appendFile(testFile, "\n追加的内容");
Task.wait(appendTask);

let read2Task = Fs.readFile(testFile);
Task.wait(read2Task);
Console.log("追加后文件内容:", read2Task.data);

Console.log("\n--- 获取文件信息 ---");
let statTask = Fs.stat(testFile);
Task.wait(statTask);
Console.log("文件信息:", statTask.data);

Console.log("\n--- 重命名文件 ---");
let newFile = "./test_fs_renamed.txt";
let renameTask = Fs.rename(testFile, newFile);
Task.wait(renameTask);
Console.log("文件重命名为:", newFile, ", code:", renameTask.code);

Console.log("\n--- 删除文件 ---");
let removeTask = Fs.remove(newFile);
Task.wait(removeTask);
Console.log("文件", newFile, "删除完成, code:", removeTask.code);

Console.log("\n--- 删除目录 ---");
let rmdirTask = Fs.rmdir(testDir);
Task.wait(rmdirTask);
Console.log("目录", testDir, "删除完成, code:", rmdirTask.code);

Console.log("\n--- 读取目录内容 ---");
let readDirTask = Fs.readDir(".");
Task.wait(readDirTask);
Console.log("当前目录内容:", readDirTask.data);
