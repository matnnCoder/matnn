Console.log("=== 流式哈希（大文件分段摘要） ===");

Console.log("\n--- SHA256 流式哈希 ---");
var ctx = Crypto.streamHash("create", "sha256");
Console.log("创建流式哈希上下文:", ctx);

Crypto.streamHash("update", ctx, Crypto.hexEncode("Hello"));
Crypto.streamHash("update", ctx, Crypto.hexEncode(", "));
Crypto.streamHash("update", ctx, Crypto.hexEncode("Stream!"));

var streamResult = Crypto.streamHash("final", ctx);
Console.log("流式SHA256:", streamResult);

var directResult = Crypto.sha256("Hello, Stream!");
Console.log("直接SHA256:", directResult);
Console.log("结果一致:", streamResult === directResult ? "成功" : "失败");

Console.log("\n--- MD5 流式哈希 ---");
var ctxMd5 = Crypto.streamHash("create", "md5");
Crypto.streamHash("update", ctxMd5, Crypto.hexEncode("Hello"));
Crypto.streamHash("update", ctxMd5, Crypto.hexEncode(", World!"));
var md5Stream = Crypto.streamHash("final", ctxMd5);
var md5Direct = Crypto.md5("Hello, World!");
Console.log("流式MD5: ", md5Stream);
Console.log("直接MD5: ", md5Direct);
Console.log("结果一致:", md5Stream === md5Direct ? "成功" : "失败");

Console.log("\n--- SHA1 流式哈希 ---");
var ctxSha1 = Crypto.streamHash("create", "sha1");
Crypto.streamHash("update", ctxSha1, Crypto.hexEncode("Hello"));
Crypto.streamHash("update", ctxSha1, Crypto.hexEncode(", SHA1!"));
var sha1Stream = Crypto.streamHash("final", ctxSha1);
var sha1Direct = Crypto.sha1("Hello, SHA1!");
Console.log("流式SHA1: ", sha1Stream);
Console.log("直接SHA1: ", sha1Direct);
Console.log("结果一致:", sha1Stream === sha1Direct ? "成功" : "失败");

Console.log("\n--- SHA512 流式哈希 ---");
var ctxSha512 = Crypto.streamHash("create", "sha512");
Crypto.streamHash("update", ctxSha512, Crypto.hexEncode("Hello"));
Crypto.streamHash("update", ctxSha512, Crypto.hexEncode(", SHA512!"));
var sha512Stream = Crypto.streamHash("final", ctxSha512);
var sha512Direct = Crypto.sha512("Hello, SHA512!");
Console.log("流式SHA512: ", sha512Stream);
Console.log("直接SHA512:", sha512Direct);
Console.log("结果一致:", sha512Stream === sha512Direct ? "成功" : "失败");

Console.log("\n--- destroy 手动销毁上下文 ---");
var ctx2 = Crypto.streamHash("create", "sha256");
Crypto.streamHash("update", ctx2, Crypto.hexEncode("data"));
Crypto.streamHash("destroy", ctx2);
Console.log("上下文已销毁");
