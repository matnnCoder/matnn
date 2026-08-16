Console.log("=== Simple Debug ===");
var big = Image.create(100, 100, Image.RGB8);
Console.log("big.width:", big.width);
Console.log("big.height:", big.height);

var resized = big.resize(50, 50);
Console.log("resized is null:", resized == null);
Console.log("resized.width:", resized.width);
Console.log("resized.height:", resized.height);

var cropped = big.crop(10, 10, 30, 30);
Console.log("cropped is null:", cropped == null);
Console.log("cropped.width:", cropped.width);
Console.log("cropped.height:", cropped.height);

var copied = big.copy();
Console.log("copied.width:", copied.width);
Console.log("copied.height:", copied.height);
