Console.log("=== String 字符串基础 ===");

Console.log("\n--- 字符串创建 ---");
var s1 = "Hello World";
var s2 = 'Single Quoted';
var s3 = `Template Literal`;
Console.log("双引号:", s1);
Console.log("单引号:", s2);
Console.log("模板字符串:", s3);

Console.log("\n--- 字符串长度 ---");
Console.log(s1 + ".length:", s1.length);
Console.log("'中文'.length:", "中文".length);
Console.log("''.length:", "".length);

Console.log("\n--- charAt / charCodeAt ---");
var hello = "Hello";
Console.log("charAt(0):", hello.charAt(0));
Console.log("charAt(4):", hello.charAt(4));
Console.log("charAt(10) 越界:", hello.charAt(10));
Console.log("charCodeAt(0):", hello.charCodeAt(0));
Console.log("charCodeAt(1):", hello.charCodeAt(1));

Console.log("\n--- 字符串拼接 ---");
var firstName = "John";
var lastName = "Doe";
var fullName = firstName + " " + lastName;
Console.log("+ 拼接:", fullName);
Console.log("concat:", firstName.concat(" ", lastName));

Console.log("\n--- 模板字符串 ---");
var name = "Alice";
var age = 25;
var city = "Shanghai";
var intro = `姓名: ${name}, 年龄: ${age}, 城市: ${city}`;
Console.log("模板插值:", intro);

Console.log("\n--- 多行字符串 ---");
var multi = `第一行
第二行
第三行`;
Console.log(multi);

Console.log("\n--- 通过 charAt 访问字符 ---");
var str = "ABCDEFG";
Console.log("charAt(0):", str.charAt(0));
Console.log("charAt(3):", str.charAt(3));
Console.log("charAt(6):", str.charAt(6));

Console.log("\n--- 类型检查 ---");
Console.log("typeof 'hello':", typeof "hello");

Console.log("\n=== String 基础 完成 ===");
