Console.log("=== Format test ===");

var rgba = Image.create(10, 10, Image.RGBA8);
var rr = rgba.resize(5, 5);
Console.log("RGBA resize width:", rr.width, "height:", rr.height);

var rgb = Image.create(10, 10, Image.RGB8);
var rg = rgb.resize(5, 5);
Console.log("RGB resize width:", rg.width);

var gray = Image.create(10, 10, Image.GRAY8);
var gg = gray.resize(5, 5);
Console.log("GRAY resize width:", gg.width);

var flt = Image.create(10, 10, Image.FLOAT32);
var fg = flt.resize(5, 5);
Console.log("FLOAT resize width:", fg.width);

Console.log("\n=== Chained resize ===");
var chain = Image.create(100, 100, Image.RGB8).resize(50, 50).resize(25, 25);
Console.log("chain width:", chain.width);

Console.log("\n=== Chained crop ===");
var cc = Image.create(100, 100, Image.RGB8).crop(10, 10, 50, 50).crop(5, 5, 20, 20);
Console.log("cc width:", cc.width);

Console.log("\n=== All done ===");
