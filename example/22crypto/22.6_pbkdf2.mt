Console.log("=== PBKDF2 密钥派生 ===");

Console.log("\n--- 基本用法 ---");
let password = Crypto.hexEncode("my_password");
let salt = Crypto.hexEncode("my_salt");
let iterations = 10000;
let keyLen = 32;

let derivedKey = Crypto.pbkdf2(password, salt, iterations, keyLen);
Console.log("password: my_password");
Console.log("salt: my_salt");
Console.log("iterations:", iterations);
Console.log("keyLen:", keyLen);
Console.log("派生密钥(hex):", derivedKey);
Console.log("密钥长度:", derivedKey.length, "hex字符 =", derivedKey.length / 2, "字节");

Console.log("\n--- 不同迭代次数 ---");
let derivedKey1k = Crypto.pbkdf2(password, salt, 1000, 32);
let derivedKey10k = Crypto.pbkdf2(password, salt, 10000, 32);
let derivedKey50k = Crypto.pbkdf2(password, salt, 50000, 32);
Console.log("1000次:  ", derivedKey1k);
Console.log("10000次: ", derivedKey10k);
Console.log("50000次:", derivedKey50k);
Console.log("不同迭代结果不同:", derivedKey1k !== derivedKey10k && derivedKey10k !== derivedKey50k ? "成功" : "失败");

Console.log("\n--- 不同密钥长度 ---");
let derivedKey16B = Crypto.pbkdf2(password, salt, 10000, 16);
let derivedKey32B = Crypto.pbkdf2(password, salt, 10000, 32);
let derivedKey64B = Crypto.pbkdf2(password, salt, 10000, 64);
Console.log("16字节:", derivedKey16B.length, "hex字符");
Console.log("32字节:", derivedKey32B.length, "hex字符");
Console.log("64字节:", derivedKey64B.length, "hex字符");

Console.log("\n--- 一致性验证 ---");
let derivedKeyA = Crypto.pbkdf2(password, salt, 10000, 32);
let derivedKeyB = Crypto.pbkdf2(password, salt, 10000, 32);
Console.log("相同参数结果一致:", derivedKeyA === derivedKeyB ? "成功" : "失败");

Console.log("\n--- 不同密码不同结果 ---");
let derivedKeyPwd1 = Crypto.pbkdf2(Crypto.hexEncode("password1"), salt, 10000, 32);
let derivedKeyPwd2 = Crypto.pbkdf2(Crypto.hexEncode("password2"), salt, 10000, 32);
Console.log("不同密码结果不同:", derivedKeyPwd1 !== derivedKeyPwd2 ? "成功" : "失败");
