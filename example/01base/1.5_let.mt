Console.log("=== let 关键字 (var 的别名) ===");

let name = "Matnn";
let version = 1.0;
let isActive = true;

Console.log("let name:", name);
Console.log("let version:", version);
Console.log("let isActive:", isActive);

let a = 10;
let b = 20;
let c = a + b;
Console.log("let a + let b =", c);

let arr = [1, 2, 3];
for (let i = 0; i < arr.length; i++) {
    Console.log("let i =", i);
}

var d = 100;
let e = 200;
Console.log("var d:", d);
Console.log("let e:", e);