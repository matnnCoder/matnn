Console.log("=== App 对象测试 ===");

Console.log("\n--- 1. 进程ID ---");
Console.log("pid:", App.pid);

Console.log("\n--- 2. 当前工作目录 ---");
Console.log("cwd:", App.cwd());

Console.log("\n--- 3. 环境变量 ---");
let path = App.env("PATH");
if (path != null) {
    Console.log("PATH exists, length:", path.length);
} else {
    Console.log("PATH not found");
}
let user = App.env("USERNAME");
Console.log("USERNAME:", user);

Console.log("\n--- 4. 命令行参数 ---");
Console.log("argv:", App.argv);
Console.log("argv count:", App.argv.length);
for (let i = 0; i < App.argv.length; i++) {
    Console.log("  argv[" + i + "]:", App.argv[i]);
}

Console.log("\n--- 5. onExit 回调 ---");
App.onExit = () => {
    Console.log("[onExit] 进程即将退出");
};
App.onExit = () => {
    Console.log("[onExit] 第二个回调");
};
Console.log("onExit 已注册");

Console.log("\n=== App 测试完成 ===");

Console.log("\n--- 6. exit 测试 (退出码42) ---");
Console.log("即将调用 App.exit(42)，onExit 回调将被触发");
App.exit(42);
