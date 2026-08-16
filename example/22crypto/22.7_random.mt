Console.log("=== 安全随机数 ===");

Console.log("\n--- randomBytes ---");
var rand16 = Crypto.randomBytes(16);
Console.log("randomBytes(16):", rand16);
Console.log("长度:", rand16.length, "hex字符 =", rand16.length / 2, "字节");

var rand32 = Crypto.randomBytes(32);
Console.log("randomBytes(32):", rand32);

var rand1 = Crypto.randomBytes(8);
var rand2 = Crypto.randomBytes(8);
Console.log("两次随机不同:", rand1 !== rand2 ? "成功" : "失败(极小概率)");

Console.log("\n--- randomUint32 ---");
var u32_1 = Crypto.randomUint32();
var u32_2 = Crypto.randomUint32();
Console.log("randomUint32():", u32_1);
Console.log("randomUint32():", u32_2);
Console.log("两次不同:", u32_1 !== u32_2 ? "成功" : "失败(极小概率)");

Console.log("\n--- randomUint64 ---");
var u64_1 = Crypto.randomUint64();
var u64_2 = Crypto.randomUint64();
Console.log("randomUint64():", u64_1);
Console.log("randomUint64():", u64_2);
Console.log("两次不同:", u64_1 !== u64_2 ? "成功" : "失败(极小概率)");

Console.log("\n--- 不同长度 ---");
var r1 = Crypto.randomBytes(1);
var r4 = Crypto.randomBytes(4);
var r64 = Crypto.randomBytes(64);
var r128 = Crypto.randomBytes(128);
Console.log("1字节:  ", r1);
Console.log("4字节:  ", r4);
Console.log("64字节: ", r4);
Console.log("128字节长度:", r128.length, "hex字符");

Console.log("\n--- 随机性验证 ---");
var allDifferent = true;
var prev = Crypto.randomBytes(4);
for (var i = 0; i < 10; i++) {
    var curr = Crypto.randomBytes(4);
    if (curr === prev) {
        allDifferent = false;
    }
    prev = curr;
}
Console.log("连续10次4字节随机数均不同:", allDifferent ? "成功" : "失败(极小概率)");
