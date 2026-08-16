Console.log("=== 正则表达式 RegExp ===");

var pattern = "hello";
var re = new RegExp(pattern);
Console.log("new RegExp('hello'):", re);
Console.log("re.pattern:", re.pattern);
Console.log("re.flags:", re.flags);

var str = "Hello, world! hello matnn";

Console.log("\n=== test() 方法 ===");
Console.log("re.test('Hello'):", re.test("Hello"));
Console.log("re.test('hello'):", re.test("hello"));
Console.log("re.test(str):", re.test(str));

var reG = new RegExp(pattern, "g");
Console.log("\n=== 全局匹配 g 标志 ===");
Console.log("reG.test(str):", reG.test(str));
Console.log("reG.lastIndex:", reG.lastIndex);
Console.log("reG.test(str):", reG.test(str));
Console.log("reG.lastIndex:", reG.lastIndex);

var reI = new RegExp("HELLO", "i");
Console.log("\n=== 忽略大小写 i 标志 ===");
Console.log("reI.test('hello'):", reI.test("hello"));
Console.log("reI.test('Hello'):", reI.test("Hello"));
Console.log("reI.test('HELLO'):", reI.test("HELLO"));

var reM = new RegExp("^hello", "m");
Console.log("\n=== 多行模式 m 标志 ===");
var multiLine = "world\nhello\nmatnn";
Console.log("reM.test(multiLine):", reM.test(multiLine));

Console.log("\n=== exec() 方法 ===");
var reExec = new RegExp("(\\w+)\\s+(\\w+)", "g");
var text = "hello world foo bar";
var match = reExec.exec(text);
while (match != null) {
    Console.log("匹配:", match);
    Console.log("完整匹配:", match[0]);
    Console.log("捕获组1:", match[1]);
    Console.log("捕获组2:", match[2]);
    Console.log("索引:", reExec.lastIndex);
    match = reExec.exec(text);
}

Console.log("\n=== 验证邮箱 ===");
var emailRegex = new RegExp("^[\\w.-]+@[\\w.-]+\\.\\w+$", "i");
Console.log("emailRegex.test('test@example.com'):", emailRegex.test("test@example.com"));
Console.log("emailRegex.test('invalid-email'):", emailRegex.test("invalid-email"));

Console.log("\n=== 验证手机号码 ===");
var phoneRegex = new RegExp("^1[3-9]\\d{9}$");
Console.log("phoneRegex.test('13812345678'):", phoneRegex.test("13812345678"));
Console.log("phoneRegex.test('12345678901'):", phoneRegex.test("12345678901"));

Console.log("\n=== toString() ===");
var re2 = new RegExp("test", "gi");
Console.log("re2.toString():", re2.toString());
