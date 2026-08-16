Console.log("=== OpenSsl 证书操作 ===");

Console.log("\n--- 生成RSA密钥对 ---");
var keys = Crypto.rsaGenerateKeyPair(2048);
var pubKey = keys[0];
var privKey = keys[1];
Console.log("RSA 2048位密钥对生成成功");

Console.log("\n--- 生成自签名证书 ---");
var certData = OpenSsl.generateSelfSignedCert("CN=TestCert,O=Matnn", pubKey, privKey, 365);
if (certData) {
    Console.log("证书生成成功, hex长度:", certData.length);

    Console.log("\n--- 证书信息 ---");
    Console.log("主题:", OpenSsl.getSubject(certData));
    Console.log("颁发者:", OpenSsl.getIssuer(certData));

    Console.log("\n--- 提取公钥 ---");
    var extractedPub = OpenSsl.extractPublicKey(certData);
    Console.log("公钥提取:", extractedPub ? "成功" : "失败");

    Console.log("\n--- DER转PEM ---");
    var pemData = OpenSsl.certToPem(certData);
    if (pemData) {
        Console.log("PEM转换成功, 长度:", pemData.length);
    } else {
        Console.log("PEM转换失败");
    }

    Console.log("\n--- 证书验证 ---");
    var verified = OpenSsl.verifyCert(certData, certData);
    Console.log("自签名证书验证:", verified ? "成功" : "失败");

    Console.log("\n--- 证书解析 ---");
    var certInfo = OpenSsl.parseCert(certData);
    if (certInfo) {
        Console.log("解析结果:", certInfo);
    }
} else {
    Console.log("证书生成失败!");
}

Console.log("\n--- 密钥PEM读写 ---");
var pubPem = OpenSsl.writePublicKeyToPem(pubKey);
Console.log("公钥PEM写入:", pubPem ? "成功" : "失败");

var readPubKey = OpenSsl.readPublicKeyFromPem(pubPem);
Console.log("公钥PEM读取:", readPubKey ? "成功" : "失败");
Console.log("读写一致:", readPubKey === pubKey ? "成功" : "失败");

var privPem = OpenSsl.writePrivateKeyToPem(privKey);
Console.log("私钥PEM写入:", privPem ? "成功" : "失败");

var readPrivKey = OpenSsl.readPrivateKeyFromPem(privPem);
Console.log("私钥PEM读取:", readPrivKey ? "成功" : "失败");
