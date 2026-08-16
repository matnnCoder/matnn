Console.log("=== Deep Debug ===");
var big = Image.create(100, 100, Image.RGB8);
Console.log("big.width:", big.width);

var resized = big.resize(50, 50);
Console.log("resized.width:", resized.width);
Console.log("resized.height:", resized.height);
Console.log("resized.toJson():", resized.toJson());

var cropped = big.crop(10, 10, 30, 30);
Console.log("cropped.width:", cropped.width);
Console.log("cropped.toJson():", cropped.toJson());

var copied = big.copy();
Console.log("copied.width:", copied.width);
Console.log("copied.toJson():", copied.toJson());
