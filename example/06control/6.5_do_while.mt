Console.log("=== do-while 循环 ===");

var count = 0;
do {
    Console.log("count =", count);
    count = count + 1;
} while (count < 5);

Console.log("\n=== do-while 确保至少执行一次 ===");

var i = 10;
do {
    Console.log("i =", i);
    i = i + 1;
} while (i < 5);

Console.log("即使条件一开始为假，循环体仍然执行了一次");

Console.log("\n=== 使用 do-while 计算阶乘 ===");

var n = 5;
var factorial = 1;
var j = 1;
do {
    factorial = factorial * j;
    j = j + 1;
} while (j <= n);

Console.log(n, "的阶乘是", factorial);