Console.log("=== RSA 非对称加密 ===");

Console.log("\n--- 生成密钥对 ---");
var keys = Crypto.rsaGenerateKeyPair(2048);
var pubKey = keys[0];
var privKey = keys[1];
Console.log("生成 2048 位密钥对成功");
Console.log("公钥(hex长度):", pubKey.length);
Console.log("私钥(hex长度):", privKey.length);

Console.log("\n--- 加密/解密 ---");
var plaintext = "Hello, RSA!";
var hexData = Crypto.hexEncode(plaintext);
Console.log("明文:", plaintext);

var encrypted = Crypto.rsaEncrypt(pubKey, hexData);
Console.log("加密结果(hex长度):", encrypted.length);

var decHex = Crypto.rsaDecrypt(privKey, encrypted);
var decrypted = Crypto.hexDecode(decHex);
Console.log("解密结果:", decrypted);
Console.log("验证:", plaintext === decrypted ? "成功" : "失败");

Console.log("\n--- 签名/验签 ---");
var signData = "This is important data";
var signHex = Crypto.hexEncode(signData);
var signature = Crypto.rsaSign(privKey, signHex);
Console.log("签名(hex长度):", signature.length);

var verified = Crypto.rsaVerify(pubKey, signHex, signature);
Console.log("签名验证:", verified ? "成功 签名有效" : "失败 签名无效");

var tamperHex = Crypto.hexEncode("This is tampered data");
var tamperedVerified = Crypto.rsaVerify(pubKey, tamperHex, signature);
Console.log("篡改数据验证:", tamperedVerified ? "验证失败(未检测到篡改)" : "成功 检测到篡改");

Console.log("\n--- 中文签名 ---");
var chineseData = "你好，RSA签名！";
var cnHex = Crypto.hexEncode(chineseData);
var cnSignature = Crypto.rsaSign(privKey, cnHex);
var cnVerified = Crypto.rsaVerify(pubKey, cnHex, cnSignature);
Console.log("中文签名验证:", cnVerified ? "成功" : "失败");

Console.log("\n--- 1024位密钥 ---");
var keys1024 = Crypto.rsaGenerateKeyPair(1024);
var shortHex = Crypto.hexEncode("short");
var shortCipher = Crypto.rsaEncrypt(keys1024[0], shortHex);
var shortDec = Crypto.hexDecode(Crypto.rsaDecrypt(keys1024[1], shortCipher));
Console.log("1024位密钥:", shortDec === "short" ? "成功" : "失败");

Console.log("\n--- 错误密钥测试 ---");
var wrongKeys = Crypto.rsaGenerateKeyPair(2048);
try {
    var wrongDec = Crypto.rsaDecrypt(wrongKeys[1], encrypted);
    Console.log("错误私钥解密(hex):", wrongDec);
} catch (e) {
    Console.log("错误密钥异常:", e);
}
