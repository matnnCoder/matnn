Console.log("=== AES 对称加密 ===");

Console.log("\n--- AES-GCM 加密/解密 ---");
let plaintext = "Hello, Matnn!";
let key = "1234567890123456"; // 16字节密钥

// AES接口使用hex编码的密钥和数据
Console.log("明文:", plaintext);
Console.log("密钥:", key);

let gcmCipher = Crypto.aesGcmEncrypt(key, plaintext);
Console.log("AES-GCM 加密结果(hex):", gcmCipher);

let gcmDecrypted = Crypto.aesGcmDecrypt(key, gcmCipher);
Console.log("AES-GCM 解密结果:", gcmDecrypted);
Console.log("AES-GCM 验证:", plaintext === gcmDecrypted ? "成功" : "失败");

Console.log("\n--- AES-CBC 加密/解密 ---");
let iv = "1234567890123456"; // 16字节IV

let cbcCipher = Crypto.aesCbcEncrypt(key, iv, plaintext);
Console.log("AES-CBC 加密结果(hex):", cbcCipher);

let cbcDecrypted = Crypto.aesCbcDecrypt(key, iv, cbcCipher);
Console.log("AES-CBC 解密结果:", cbcDecrypted);
Console.log("AES-CBC 验证:", plaintext === cbcDecrypted ? "成功" : "失败");

Console.log("\n--- 不同密钥长度 ---");
let key16 = "0123456789ABCDEF";
let key24 = "0123456789ABCDEFGHIJKLMN";
let key32 = "0123456789ABCDEFGHIJKLMNOPQRSTUV";

let testStr = "test 16";
let c16 = Crypto.aesCbcEncrypt(key16, iv, testStr);
let d16 = Crypto.aesCbcDecrypt(key16, iv, c16);
Console.log("16字节密钥:", d16 === testStr ? "成功" : "失败");

let testStr2 = "test 24";
let c24 = Crypto.aesCbcEncrypt(key24, iv, testStr2);
let d24 = Crypto.aesCbcDecrypt(key24, iv, c24);
Console.log("24字节密钥:", d24 === testStr2 ? "成功" : "失败");

let testStr3 = "test 32";
let c32 = Crypto.aesCbcEncrypt(key32, iv, testStr3);
let d32 = Crypto.aesCbcDecrypt(key32, iv, c32);
Console.log("32字节密钥:", d32 === testStr3 ? "成功" : "失败");

Console.log("\n--- 中文加密 ---");
let chineseText = "你好，世界！";
let cnCipher = Crypto.aesGcmEncrypt(key, chineseText);
let cnDecrypted = Crypto.aesGcmDecrypt(key, cnCipher);
Console.log("中文加密(hex):", cnCipher);
Console.log("中文解密:", cnDecrypted);
Console.log("验证:", chineseText === cnDecrypted ? "成功" : "失败");

Console.log("\n--- 错误密钥测试 ---");
let wrongKey = "wrongkeywrongkey";
try {
    let wrongDec = Crypto.aesGcmDecrypt(wrongKey, gcmCipher);
    Console.log("错误密钥解密结果(hex):", wrongDec);
} catch (e) {
    Console.log("错误密钥异常:", e);
}
