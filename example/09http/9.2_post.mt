Console.log("=== HTTP POST 请求 ===");

let postBody = '{"name":"matnn","version":"1.0"}';
let headers = {};
headers["Content-Type"] = "application/json";

let postTask = Http.post("http://httpbin.org/post", postBody, headers);

Task.wait(postTask);
Console.log("POST 响应:", postTask);
Console.log("状态码:", postTask.code);
Console.log("返回数据:", postTask.data);
