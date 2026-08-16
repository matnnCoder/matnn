Console.log("=== HMAC 消息认证码 ===");

Console.log("\n--- HMAC-SHA256 ---");
var hmac256_1 = Crypto.hmacSha256("SecretKey", "Hello, HMAC!");
Console.log("hmacSha256('SecretKey', 'Hello, HMAC!'):", hmac256_1);

var hmac256_2 = Crypto.hmacSha256("SecretKey", "Hello, HMAC!");
Console.log("一致性验证:", hmac256_1 === hmac256_2 ? "成功" : "失败");

var hmac256_3 = Crypto.hmacSha256("DifferentKey", "Hello, HMAC!");
Console.log("不同密钥:", hmac256_1 === hmac256_3 ? "相同(异常)" : "不同(正确)");

Console.log("\n--- HMAC-SHA512 ---");
var hmac512 = Crypto.hmacSha512(Crypto.hexEncode("SecretKey"), Crypto.hexEncode("Hello, HMAC!"));
Console.log("hmacSha512('SecretKey', 'Hello, HMAC!'):", hmac512);

Console.log("\n--- HMAC-SHA1 ---");
var hmacSha1 = Crypto.hmacSha1(Crypto.hexEncode("SecretKey"), Crypto.hexEncode("Hello, HMAC-SHA1!"));
Console.log("hmacSha1('SecretKey', 'Hello, HMAC-SHA1!'):", hmacSha1);

Console.log("\n--- 中文测试 ---");
var cnHmac = Crypto.hmacSha256("密钥", "你好，HMAC！");
Console.log("hmacSha256('密钥', '你好，HMAC！'):", cnHmac);

Console.log("\n--- 空数据测试 ---");
var emptyHmac = Crypto.hmacSha256("key", "");
Console.log("hmacSha256('key', ''):", emptyHmac);
