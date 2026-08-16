Console.log("=== typeof 类型运算符 ===");

var num = 42;
var str = "hello";
var bool = true;
var arr = [1, 2, 3];
var obj = {name: "Alice"};
var func = function() {};
var nullVal = null;

Console.log("typeof num:", typeof num);
Console.log("typeof str:", typeof str);
Console.log("typeof bool:", typeof bool);
Console.log("typeof arr:", typeof arr);
Console.log("typeof obj:", typeof obj);
Console.log("typeof func:", typeof func);
Console.log("typeof nullVal:", typeof nullVal);

Console.log("\n=== instanceof 实例运算符 ===");

var arr2 = [1, 2, 3];
var obj2 = {name: "Bob"};

Console.log("arr2 instanceof Array:", arr2 instanceof Array);
Console.log("obj2 instanceof Object:", obj2 instanceof Object);

Console.log("\n=== 结合 typeof 进行类型检查 ===");

function printType(value) {
    var type = typeof value;
    switch (type) {
        case "number":
            Console.log(value, "是数字");
            break;
        case "string":
            Console.log(value, "是字符串");
            break;
        case "boolean":
            Console.log(value, "是布尔值");
            break;
        case "object":
            Console.log(value, "是对象或数组");
            break;
        case "function":
            Console.log(value, "是函数");
            break;
        default:
            Console.log(value, "的类型是", type);
    }
}

printType(123);
printType("hello");
printType(true);
printType([1, 2, 3]);