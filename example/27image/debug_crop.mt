// Debug crop/resize
Console.log("=== Debug crop ===");
var big = Image.create(100, 100, Image.RGBA8);
Console.log("big type:", typeof big);
Console.log("big.width:", big.width);

var cropped = big.crop(5, 5, 20, 20);
Console.log("cropped type:", typeof cropped);
Console.log("cropped:", cropped);

// Try calling width method directly
Console.log("\n=== Direct method call ===");
var w = big.width();
Console.log("big.width() direct:", w);