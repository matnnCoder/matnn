Console.log("=== String 字符串搜索 ===");

var text = "Hello World, Hello Matnn, Hello String!";

Console.log("\n--- indexOf ---");
Console.log("indexOf('Hello'):", text.indexOf("Hello"));
Console.log("indexOf('Hello', 5):", text.indexOf("Hello", 5));
Console.log("indexOf('Hello', 20):", text.indexOf("Hello", 20));
Console.log("indexOf('NotFound'):", text.indexOf("NotFound"));

Console.log("\n--- lastIndexOf ---");
Console.log("lastIndexOf('Hello'):", text.lastIndexOf("Hello"));
Console.log("lastIndexOf('Hello', 20):", text.lastIndexOf("Hello", 20));
Console.log("lastIndexOf('Hello', 10):", text.lastIndexOf("Hello", 10));
Console.log("lastIndexOf('NotFound'):", text.lastIndexOf("NotFound"));

Console.log("\n--- includes ---");
Console.log("includes('World'):", text.includes("World"));
Console.log("includes('Matnn'):", text.includes("Matnn"));
Console.log("includes('world'):", text.includes("world"));
Console.log("includes('Hello', 15):", text.includes("Hello", 15));

Console.log("\n--- startsWith ---");
Console.log("startsWith('Hello'):", text.startsWith("Hello"));
Console.log("startsWith('World'):", text.startsWith("World"));
Console.log("startsWith('World', 6):", text.startsWith("World", 6));
Console.log("startsWith('Hello', 13):", text.startsWith("Hello", 13));

Console.log("\n--- endsWith ---");
Console.log("endsWith('!'):", text.endsWith("!"));
Console.log("endsWith('String!'):", text.endsWith("String!"));
Console.log("endsWith('World'):", text.endsWith("World"));
Console.log("endsWith('Hello', 5):", text.endsWith("Hello", 5));

Console.log("\n--- 搜索应用 ---");
var url = "https://matnn.dev/docs/string";
Console.log("URL:", url);
Console.log("包含 'https':", url.includes("https"));
Console.log("以 'https' 开头:", url.startsWith("https"));
Console.log("以 '/string' 结尾:", url.endsWith("/string"));

var fileName = "document.pdf";
Console.log("文件名:", fileName);
Console.log("是 PDF 文件:", fileName.endsWith(".pdf"));
Console.log("是图片文件:", fileName.endsWith(".png"));

var logLevel = "ERROR: Something went wrong";
Console.log("日志:", logLevel);
Console.log("是错误日志:", logLevel.startsWith("ERROR"));
Console.log("是警告日志:", logLevel.startsWith("WARN"));

Console.log("\n=== String 搜索 完成 ===");
