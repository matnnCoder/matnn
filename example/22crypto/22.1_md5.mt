Console.log("=== 哈希算法测试 ===");

Console.log("\n--- MD5 ---");
Console.log("md5('hello'):", Crypto.md5("hello"));
Console.log("md5('world'):", Crypto.md5("world"));
Console.log("md5('hello world'):", Crypto.md5("hello world"));
Console.log("md5(''):", Crypto.md5(""));
Console.log("md5('你好世界'):", Crypto.md5("你好世界"));

var longStr = "This is a very long string for testing MD5 hash function in matnn programming language";
Console.log("md5(longString):", Crypto.md5(longStr));

Console.log("\n--- SHA1 ---");
Console.log("sha1('hello'):", Crypto.sha1("hello"));
Console.log("sha1('你好世界'):", Crypto.sha1("你好世界"));

Console.log("\n--- SHA256 ---");
Console.log("sha256('hello'):", Crypto.sha256("hello"));
Console.log("sha256('你好世界'):", Crypto.sha256("你好世界"));

Console.log("\n--- SHA512 ---");
Console.log("sha512('hello'):", Crypto.sha512("hello"));
Console.log("sha512('你好世界'):", Crypto.sha512("你好世界"));

Console.log("\n--- 验证一致性 ---");
var r1 = Crypto.md5("test");
var r2 = Crypto.md5("test");
Console.log("md5('test') == md5('test'):", r1 === r2);

var r3 = Crypto.md5("test1");
var r4 = Crypto.md5("test2");
Console.log("md5('test1') == md5('test2'):", r3 === r4);

Console.log("\n--- 不同算法对比 ---");
Console.log("md5    ('hello'):", Crypto.md5("hello"));
Console.log("sha1   ('hello'):", Crypto.sha1("hello"));
Console.log("sha256 ('hello'):", Crypto.sha256("hello"));
Console.log("sha512 ('hello'):", Crypto.sha512("hello"));
