Console.log("=== 异常处理 (try-catch) ===");

function test1() {
    try {
        Console.log("Test1: 进入 try 块");
        var x = 1 + 2;
        Console.log("Test1: x =", x);
    } catch (e) {
        Console.error("Test1 错误:", e);
    }
}

test1();
Console.log("Test1 完成");

function test2() {
    try {
        Console.log("Test2: 进入 try 块");
        var y = 3 * 4;
        Console.log("Test2: y =", y);
    } catch (e) {
        Console.error("Test2 错误:", e);
    }
}

test2();
Console.log("Test2 完成");
