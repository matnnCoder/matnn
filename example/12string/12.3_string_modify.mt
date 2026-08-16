Console.log("=== String 字符串修改 ===");

Console.log("\n--- concat ---");
var s1 = "Hello";
Console.log("concat(' World'):", s1.concat(" World"));
Console.log("concat(' ', 'Matnn'):", s1.concat(" ", "Matnn"));
Console.log("concat 多参数:", "".concat("a", "b", "c", "d"));

Console.log("\n--- slice ---");
var s2 = "Hello World";
Console.log("slice(0, 5):", s2.slice(0, 5));
Console.log("slice(6):", s2.slice(6));
Console.log("slice(-5):", s2.slice(-5));
Console.log("slice(-5, -1):", s2.slice(-5, -1));
Console.log("slice(3, 8):", s2.slice(3, 8));

Console.log("\n--- substring ---");
var s3 = "Hello World";
Console.log("substring(0, 5):", s3.substring(0, 5));
Console.log("substring(6):", s3.substring(6));
Console.log("substring(5, 0) 自动交换:", s3.substring(5, 0));
Console.log("substring(-3):", s3.substring(-3));
Console.log("substring(0, 100):", s3.substring(0, 100));

Console.log("\n--- substr ---");
var s4 = "Hello World";
Console.log("substr(0, 5):", s4.substr(0, 5));
Console.log("substr(6, 5):", s4.substr(6, 5));
Console.log("substr(-5, 5):", s4.substr(-5, 5));
Console.log("substr(0):", s4.substr(0));

Console.log("\n--- replace ---");
var s5 = "The quick brown fox jumps over the lazy dog";
Console.log("原字符串:", s5);
Console.log("replace('fox', 'cat'):", s5.replace("fox", "cat"));
Console.log("replace('dog', 'bird'):", s5.replace("dog", "bird"));
Console.log("replace('o', '0') 只替换首个:", s5.replace("o", "0"));

Console.log("\n--- split ---");
var s6 = "apple,banana,orange,grape";
Console.log("split(','):", s6.split(","));
Console.log("split(',', 2):", s6.split(",", 2));

var s7 = "one-two-three-four";
Console.log("split('-'):", s7.split("-"));

var s8 = "Hello World";
Console.log("split('') 逐字符:", s8.split(""));

Console.log("\n--- trim ---");
var s9 = "  Hello World  ";
Console.log("原字符串:", "[" + s9 + "]");
Console.log("trim():", "[" + s9.trim() + "]");

// 使用 trim 去除所有首尾空白
var s10 = "  Spaces  ";
Console.log("trim 前后:", "[" + s10 + "]", "->", "[" + s10.trim() + "]");

Console.log("\n--- 应用示例 ---");
var csvLine = "  Name , Age , City  ";
Console.log("CSV 行:", csvLine);
var parts = csvLine.split(",");
Console.log("拆分后:");
Console.log("  parts[0]:", "[" + parts[0] + "]");
Console.log("  parts[1]:", "[" + parts[1] + "]");
Console.log("  parts[2]:", "[" + parts[2] + "]");

var path = "/api/users/123/ posts";
Console.log("路径:", path);
var segments = path.split("/");
Console.log("路径段数:", segments.length);

Console.log("\n=== String 修改 完成 ===");
