Console.log("=== String 大小写转换 ===");

Console.log("\n--- toUpperCase ---");
var s1 = "hello world";
Console.log("原字符串:", s1);
Console.log("toUpperCase():", s1.toUpperCase());

var s2 = "Hello World";
Console.log("混合大小写:", s2);
Console.log("toUpperCase():", s2.toUpperCase());

Console.log("\n--- toLowerCase ---");
var s3 = "HELLO WORLD";
Console.log("原字符串:", s3);
Console.log("toLowerCase():", s3.toLowerCase());

var s4 = "Hello World";
Console.log("混合大小写:", s4);
Console.log("toLowerCase():", s4.toLowerCase());

Console.log("\n--- 大小写应用 ---");
var email = "User@Example.COM";
Console.log("邮箱:", email);
var lowerEmail = email.toLowerCase();
Console.log("标准化为小写:", lowerEmail);

var tag = "JavaScript";
Console.log("标签:", tag);
var upperTag = tag.toUpperCase();
Console.log("转为大写:", upperTag);
var isMatch = upperTag == "JAVASCRIPT";
Console.log("与 'JAVASCRIPT' 比较:", isMatch);

Console.log("\n--- 字符串重复 ---");
function repeatString(s, count) {
    var result = "";
    var n = 0;
    while (n < count) {
        result = result + s;
        n = n + 1;
    }
    return result;
}
Console.log("repeatString('ab', 3):", repeatString("ab", 3));
Console.log("repeatString('*', 5):", repeatString("*", 5));
Console.log("repeatString('hello', 2):", repeatString("hello", 2));

Console.log("\n--- 字符串包含检测 ---");
var text = "The quick brown fox jumps over the lazy dog";
Console.log("文本:", text);
Console.log("包含 'fox':", text.includes("fox"));
Console.log("包含 'cat':", text.includes("cat"));
Console.log("以 'The' 开头:", text.startsWith("The"));
Console.log("以 'dog' 结尾:", text.endsWith("dog"));

Console.log("\n--- 子串提取 ---");
var greeting = "Hello, Matnn!";
Console.log("原字符串:", greeting);
Console.log("substring(0, 5):", greeting.substring(0, 5));
Console.log("substring(7):", greeting.substring(7));
Console.log("substr(7, 5):", greeting.substr(7, 5));
Console.log("slice(-6):", greeting.slice(-6));

Console.log("\n--- 字符串替换 ---");
var sentence = "I like cats and cats are nice";
Console.log("原句:", sentence);
var replaced = sentence.replace("cats", "dogs");
Console.log("replace('cats', 'dogs'):", replaced);

Console.log("\n=== String 大小写 完成 ===");
