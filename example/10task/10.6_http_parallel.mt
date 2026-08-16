Console.log("=== HTTP 并行请求 ===");

Console.log("\n--- 串行等待 HTTP 请求 ---");
var h1 = Http.get("http://httpbin.org/get");
Task.wait(h1);
Console.log("响应:", h1.data);

Console.log("\n--- 并行 HTTP 请求 ---");
var p1 = Http.get("http://httpbin.org/get");
var p2 = Http.get("http://httpbin.org/get");

Console.log("两个请求已并行启动");
Task.wait(p1, p2);

Console.log("p1 响应:", p1.data);
Console.log("p2 响应:", p2.data);
