Console.log("=== try-catch-finally 语句 ===");

function testFinally() {
    Console.log("进入 testFinally 函数");
    try {
        Console.log("进入 try 块");
        var x = 10;
        Console.log("x =", x);
        return "try 返回值";
    } catch (e) {
        Console.error("错误:", e);
        return "catch 返回值";
    } finally {
        Console.log("进入 finally 块");
        Console.log("finally 块总是会执行");
    }
    Console.log("这里不会执行");
}

var result = testFinally();
Console.log("函数返回值:", result);

Console.log("\n=== 即使发生异常 finally 也会执行 ===");

function testWithError() {
    Console.log("进入 testWithError 函数");
    try {
        Console.log("进入 try 块");
        var y = undefinedVariable;
    } catch (e) {
        Console.error("捕获到错误:", e);
    } finally {
        Console.log("finally 块执行完毕");
    }
    Console.log("函数继续执行");
}

testWithError();

Console.log("\n=== finally 中修改返回值 ===");

function testReturnValue() {
    try {
        return "try";
    } finally {
        Console.log("finally 执行");
    }
}

Console.log("返回值:", testReturnValue());