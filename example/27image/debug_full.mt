Console.log("=== Pixel data test ===");
var big = Image.create(100, 100, Image.RGB8);
big.setPixel(10, 10, {r: 255, g: 128, b: 64, a: 255});
var p = big.getPixel(10, 10);
Console.log("original pixel:", p.r, p.g, p.b, p.a);

var resized = big.resize(50, 50);
Console.log("resized.width:", resized.width);
Console.log("resized.height:", resized.height);
var rp = resized.getPixel(5, 5);
Console.log("resized pixel(5,5):", rp.r, rp.g, rp.b, rp.a);

resized.setPixel(0, 0, {r: 100, g: 200, b: 50, a: 255});
var rp2 = resized.getPixel(0, 0);
Console.log("resized after set:", rp2.r, rp2.g, rp2.b, rp2.a);

var cropped = big.crop(10, 10, 30, 30);
Console.log("cropped.width:", cropped.width);
Console.log("cropped.height:", cropped.height);
var cp = cropped.getPixel(0, 0);
Console.log("cropped pixel(0,0):", cp.r, cp.g, cp.b, cp.a);

cropped.setPixel(5, 5, {r: 10, g: 20, b: 30, a: 40});
var cp2 = cropped.getPixel(5, 5);
Console.log("cropped after set:", cp2.r, cp2.g, cp2.b, cp2.a);
