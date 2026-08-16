Console.log("=== String 综合应用 ===");

Console.log("\n--- URL 解析 ---");
var url = "https://matnn.dev:8080/docs/string?page=1&lang=en";
Console.log("URL:", url);

var protocolEnd = url.indexOf("://");
var protocol = url.substring(0, protocolEnd);
Console.log("协议:", protocol);

var rest = url.substring(protocolEnd + 3);
var pathStart = rest.indexOf("/");
var hostPart = pathStart >= 0 ? rest.substring(0, pathStart) : rest;
Console.log("主机部分:", hostPart);

var colonPos = hostPart.indexOf(":");
var host = colonPos >= 0 ? hostPart.substring(0, colonPos) : hostPart;
var port = colonPos >= 0 ? hostPart.substring(colonPos + 1) : "默认";
Console.log("主机:", host);
Console.log("端口:", port);

var pathAndQuery = pathStart >= 0 ? rest.substring(pathStart) : "/";
Console.log("路径+查询:", pathAndQuery);

var queryStart = pathAndQuery.indexOf("?");
var path = queryStart >= 0 ? pathAndQuery.substring(0, queryStart) : pathAndQuery;
var queryString = queryStart >= 0 ? pathAndQuery.substring(queryStart + 1) : "";
Console.log("路径:", path);
Console.log("查询串:", queryString);

if (queryString.length > 0) {
    var params = queryString.split("&");
    Console.log("查询参数:");
    for (var p = 0; p < params.length; p++) {
        var pair = params[p].split("=");
        Console.log("  " + pair[0] + " = " + pair[1]);
    }
}

Console.log("\n--- 文件名处理 ---");
var filePath = "/home/user/documents/report_2024.pdf";
Console.log("文件路径:", filePath);

var lastSlash = filePath.lastIndexOf("/");
var fileName = lastSlash >= 0 ? filePath.substring(lastSlash + 1) : filePath;
Console.log("文件名:", fileName);

var dotPos = fileName.lastIndexOf(".");
var baseName = dotPos >= 0 ? fileName.substring(0, dotPos) : fileName;
var extension = dotPos >= 0 ? fileName.substring(dotPos) : "";
Console.log("基础名:", baseName);
Console.log("扩展名:", extension);

Console.log("\n--- 字符串验证 ---");
function isValidEmail(email) {
    var atPos = email.indexOf("@");
    if (atPos <= 0) {
        return false;
    }
    var dotPos2 = email.lastIndexOf(".");
    if (dotPos2 <= atPos) {
        return false;
    }
    if (dotPos2 >= email.length - 1) {
        return false;
    }
    return true;
}
Console.log("isValidEmail('user@example.com'):", isValidEmail("user@example.com"));
Console.log("isValidEmail('invalid'):", isValidEmail("invalid"));
Console.log("isValidEmail('a@b.c'):", isValidEmail("a@b.c"));
Console.log("isValidEmail('@b.com'):", isValidEmail("@b.com"));

function isNumeric(str) {
    if (str.length == 0) {
        return false;
    }
    var start = 0;
    var firstCh = str.charAt(0);
    if (firstCh == "-" || firstCh == "+") {
        start = 1;
    }
    if (start >= str.length) {
        return false;
    }
    var idx = start;
    while (idx < str.length) {
        var ch = str.charAt(idx);
        var isDigit = ch == "0" || ch == "1" || ch == "2" || ch == "3" || ch == "4" ||
                      ch == "5" || ch == "6" || ch == "7" || ch == "8" || ch == "9";
        if (!isDigit && ch != "." && ch != "e" && ch != "E") {
            return false;
        }
        idx = idx + 1;
    }
    return true;
}
Console.log("isNumeric('123'):", isNumeric("123"));
Console.log("isNumeric('-45.6'):", isNumeric("-45.6"));
Console.log("isNumeric('abc'):", isNumeric("abc"));
Console.log("isNumeric('12a3'):", isNumeric("12a3"));

Console.log("\n--- 格式化字符串 ---");
function padLeft(str, len, padChar) {
    var result = str;
    while (result.length < len) {
        result = padChar + result;
    }
    return result;
}
Console.log("padLeft('42', 5, '0'):", padLeft("42", 5, "0"));
Console.log("padLeft('7', 3, '0'):", padLeft("7", 3, "0"));
Console.log("padLeft('hi', 6, '-'):", padLeft("hi", 6, "-"));

Console.log("\n--- CSV 解析 ---");
var csvLine = " Alice , 30 , Shanghai ";
Console.log("CSV 行:", csvLine);
var trimmedLine = csvLine.trim();
var fields = trimmedLine.split(",");
Console.log("字段数:", fields.length);
Console.log("  字段0: [" + fields[0] + "]");
Console.log("  字段1: [" + fields[1] + "]");
Console.log("  字段2: [" + fields[2] + "]");

Console.log("\n=== String 综合 完成 ===");
