Console.log("基本 for 循环:");
var sum = 0;
for (var i = 0; i < 10; i++) {
    sum = sum + i;
}
Console.log("0到9的和:", sum);

Console.log("\n数组遍历:");
var arr = [1, 2, 3, 4, 5];
var total = 0;
for (var j = 0; j < arr.length; j++) {
    total = total + arr[j];
}
Console.log("数组元素和:", total);

Console.log("\nlet 在 for 循环中:");
for (let k = 0; k < 3; k++) {
    Console.log("k =", k);
}
