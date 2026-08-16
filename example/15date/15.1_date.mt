Console.log("=== Date 日期对象 ===");

Console.log("\n--- 获取当前日期时间 ---");
var now = new Date();
Console.log("当前日期时间:", now);

Console.log("\n--- 获取时间戳 ---");
Console.log("Date.now():", Date.now());
Console.log("now.getTime():", now.getTime());

Console.log("\n--- 获取日期组件 ---");
Console.log("年:", now.getFullYear());
Console.log("月:", now.getMonth() + 1);
Console.log("日:", now.getDate());
Console.log("时:", now.getHours());
Console.log("分:", now.getMinutes());
Console.log("秒:", now.getSeconds());
Console.log("毫秒:", now.getMilliseconds());
Console.log("星期:", now.getDay());

Console.log("\n--- 日期字符串转换 ---");
Console.log("toString():", now.toString());
Console.log("toISOString():", now.toISOString());

Console.log("\n--- 解析日期字符串 ---");
var dateStr = "2024-01-15T10:30:00";
var parsedDate = new Date(dateStr);
Console.log("解析日期:", parsedDate);
Console.log("解析日期的年份:", parsedDate.getFullYear());

Console.log("\n--- 创建指定日期 ---");
var specificDate = new Date(2024, 5, 15, 14, 30, 0);
Console.log("指定日期:", specificDate);

Console.log("\n--- 日期比较 ---");
var date1 = new Date(2024, 0, 1);
var date2 = new Date(2024, 0, 15);
var ts1 = date1.getTime();
var ts2 = date2.getTime();
Console.log("date1时间戳:", ts1);
Console.log("date2时间戳:", ts2);
var isLess = ts1 < ts2;
var isGreater = ts1 > ts2;
Console.log("ts1 < ts2:", isLess);
Console.log("ts1 > ts2:", isGreater);

Console.log("\n--- 计算日期差 ---");
var diff = date2.getTime() - date1.getTime();
var daysDiff = diff / (1000 * 60 * 60 * 24);
Console.log("两个日期相差天数:", daysDiff);