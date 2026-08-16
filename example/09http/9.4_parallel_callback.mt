Console.log("=== HTTP 天然并行 + 回调机制 ===");

Console.log("\n--- 1. 并发请求，串行等待 ---");
var p1 = Http.get("http://httpbin.org/get");
var p2 = Http.get("http://httpbin.org/get?name=test");

Console.log("两个请求已并行启动（天然并行）");
Task.wait(p1);
Console.log("p1 完成, code:", p1.code, "ok:", p1.ok);

Task.wait(p2);
Console.log("p2 完成, code:", p2.code, "ok:", p2.ok);

Console.log("\n--- 2. 串行请求 ---");
var s1 = Http.get("http://httpbin.org/get");
Task.wait(s1);
Console.log("s1 完成, code:", s1.code);

var s2 = Http.post("http://httpbin.org/post", '{"step":2}');
Task.wait(s2);
Console.log("s2 完成, code:", s2.code);

Console.log("\n--- 3. 未等待时访问默认值 ---");
var fastHandler = Http.get("http://httpbin.org/get");
Console.log("默认 code:", fastHandler.code);
Console.log("默认 ok:", fastHandler.ok);
Task.wait(fastHandler);
Console.log("等待后 code:", fastHandler.code);
Console.log("等待后 ok:", fastHandler.ok);
