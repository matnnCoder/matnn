Console.log("=== Test 1: Basic chain ===");
var img = Image.create(100, 100, Image.RGB8);
Console.log("img.width:", img.width);
Console.log("img.height:", img.height);

var r = img.resize(50, 50);
Console.log("r.width:", r.width);
Console.log("r.height:", r.height);

var c = img.crop(10, 10, 30, 30);
Console.log("c.width:", c.width);
Console.log("c.height:", c.height);

Console.log("=== Test 2: Chained access ===");
var w1 = img.resize(50, 50).width;
Console.log("chained resize.width:", w1);
var w2 = img.crop(10, 10, 30, 30).width;
Console.log("chained crop.width:", w2);

Console.log("=== Test 3: Method call on result ===");
var r2 = img.resize(50, 50);
Console.log("r2.getWidthMethod():", r2.getWidthMethod());

Console.log("=== Test 4: fromFile (async) ===");
// Skip - needs file

Console.log("=== All tests done ===");
