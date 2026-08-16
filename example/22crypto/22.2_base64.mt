Console.log("=== Base64 与 Hex 编码 ===");

Console.log("\n--- Base64 编码 ---");
Console.log("base64Encode('hello'):", Crypto.base64Encode("hello"));
Console.log("base64Encode('hello world'):", Crypto.base64Encode("hello world"));
Console.log("base64Encode('你好世界'):", Crypto.base64Encode("你好世界"));

Console.log("\n--- Base64 解码 ---");
var encoded1 = Crypto.base64Encode("hello");
Console.log("base64Decode('" + encoded1 + "'):", Crypto.base64Decode(encoded1));

var encoded2 = Crypto.base64Encode("hello world");
Console.log("base64Decode('" + encoded2 + "'):", Crypto.base64Decode(encoded2));

var encoded3 = Crypto.base64Encode("你好世界");
Console.log("base64Decode('" + encoded3 + "'):", Crypto.base64Decode(encoded3));

Console.log("\n--- Base64 往返验证 ---");
var original = "test string for base64 encoding";
var encoded = Crypto.base64Encode(original);
var decoded = Crypto.base64Decode(encoded);
Console.log("original:", original);
Console.log("encoded:", encoded);
Console.log("decoded:", decoded);
Console.log("roundtrip OK:", original === decoded);

Console.log("\n--- Base64 空字符串 ---");
Console.log("base64Encode(''):", Crypto.base64Encode(""));
Console.log("base64Decode(''):", Crypto.base64Decode(""));

Console.log("\n--- Base64 特殊字符 ---");
var specialStr = "!@#$%^&*()_+-=[]{}|;':\",./<>?";
var specialEncoded = Crypto.base64Encode(specialStr);
var specialDecoded = Crypto.base64Decode(specialEncoded);
Console.log("encode(special):", specialEncoded);
Console.log("decode(special):", specialDecoded);
Console.log("roundtrip OK:", specialStr === specialDecoded);

Console.log("\n--- Hex 编码 ---");
Console.log("hexEncode('hello'):", Crypto.hexEncode("hello"));
Console.log("hexEncode('你好世界'):", Crypto.hexEncode("你好世界"));

Console.log("\n--- Hex 解码 ---");
var hexEncoded = Crypto.hexEncode("hello");
Console.log("hexDecode('" + hexEncoded + "'):", Crypto.hexDecode(hexEncoded));

Console.log("\n--- Hex 往返验证 ---");
var hexOrig = "Hex encoding test 123";
var hexEnc = Crypto.hexEncode(hexOrig);
var hexDec = Crypto.hexDecode(hexEnc);
Console.log("original:", hexOrig);
Console.log("encoded:", hexEnc);
Console.log("decoded:", hexDec);
Console.log("roundtrip OK:", hexOrig === hexDec);
