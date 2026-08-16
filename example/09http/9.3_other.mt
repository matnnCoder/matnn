Console.log("=== HTTP PUT 请求 ===");
var putBody = '{"updated":"true"}';
var putHandler = Http.put("http://httpbin.org/put", putBody);


Console.log("\n=== HTTP DELETE 请求 ===");
var deleteHandler = Http.delete("http://httpbin.org/delete");


Console.log("\n=== HTTP 自定义请求 ===");
var customHandler = Http.request("GET", "http://httpbin.org/headers");

Console.log("=== 并发请求，串行等待 ===");
Task.wait(putHandler,deleteHandler,customHandler)

Console.log("PUT 响应:", putHandler.code);
Console.log("DELETE 响应:", deleteHandler.code);
Console.log("自定义请求响应:", customHandler.code);
