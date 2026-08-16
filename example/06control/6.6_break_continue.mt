Console.log("=== break 跳出循环 ===");

for (var i = 0; i < 10; i++) {
    if (i === 5) {
        break;
    }
    Console.log("break示例: i =", i);
}
Console.log("循环在 i=5 时跳出");

Console.log("\n=== continue 跳过本次循环 ===");

for (var j = 0; j < 10; j++) {
    if (j % 2 === 0) {
        continue;
    }
    Console.log("continue示例: j =", j);
}
Console.log("只输出了奇数");

Console.log("\n=== 在 while 循环中使用 break ===");

var k = 0;
while (true) {
    Console.log("while循环: k =", k);
    k = k + 1;
    if (k >= 4) {
        break;
    }
}

Console.log("\n=== 在 for-in 循环中使用 continue ===");

var obj = {a: 1, b: 2, c: 3, d: 4};
for (var key in obj) {
    if (key === "c") {
        continue;
    }
    Console.log("for-in: key=", key, ", value=", obj[key]);
}