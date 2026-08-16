Console.log("=== HTTP GET 请求 ===");

let getTask = Http.get("http://httpbin.org/get");
getTask.onDone=(result)=>{
    if(result.code==200){
Console.log("异步回调成功:", result.data);
    }else{
Console.log("异步回调失败:", result.code);
    }
}

Console.log("--- 未等待时的默认值 ---");
Console.log("状态码:", getTask.code);
Console.log("是否成功:", getTask.ok);

Task.wait(getTask);
Console.log("\n--- 等待后的真实值 ---");
Console.log("状态码:", getTask.code);
Console.log("是否成功:", getTask.ok);
Console.log("响应数据:", getTask.data);
