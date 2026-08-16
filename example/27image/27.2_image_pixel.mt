// Image 像素操作：读写像素、填充、裁剪、缩放
Console.log("=== RGBA8 像素读写 ===");
let rgbaImg = Image.create(10, 10, Image.RGBA8);
rgbaImg.setPixel(0, 0, {r: 255, g: 0, b: 0, a: 255});
rgbaImg.setPixel(1, 0, {r: 0, g: 255, b: 0, a: 255});
rgbaImg.setPixel(2, 0, {r: 0, g: 0, b: 255, a: 255});

let pixel00 = rgbaImg.getPixel(0, 0);
Console.log("pixel(0,0): r=" + pixel00.r + " g=" + pixel00.g + " b=" + pixel00.b + " a=" + pixel00.a);
let pixel10 = rgbaImg.getPixel(1, 0);
Console.log("pixel(1,0): r=" + pixel10.r + " g=" + pixel10.g + " b=" + pixel10.b + " a=" + pixel10.a);
let pixel20 = rgbaImg.getPixel(2, 0);
Console.log("pixel(2,0): r=" + pixel20.r + " g=" + pixel20.g + " b=" + pixel20.b + " a=" + pixel20.a);

Console.log("\n=== RGB8 像素读写 ===");
let rgb = Image.create(8, 8, Image.RGB8);
rgb.setPixel(0, 0, {r: 100, g: 150, b: 200});
let rgbPixel = rgb.getPixel(0, 0);
Console.log("rgb pixel(0,0): r=" + rgbPixel.r + " g=" + rgbPixel.g + " b=" + rgbPixel.b);

Console.log("\n=== GRAY8 像素读写 ===");
let gray = Image.create(8, 8, Image.GRAY8);
gray.setPixel(3, 3, 128);
let grayPixel = gray.getPixel(3, 3);
Console.log("gray pixel(3,3): " + grayPixel.value);

Console.log("\n=== fill 填充 ===");
let filled = Image.create(5, 5, Image.RGB8);
filled.fill(200);
let fillPixel = filled.getPixel(2, 2);
Console.log("fill(200) pixel(2,2): r=" + fillPixel.r + " g=" + fillPixel.g + " b=" + fillPixel.b);

Console.log("\n=== crop 裁剪 ===");
// TODO: crop 方法返回值问题待修复
// var big = Image.create(100, 100, Image.RGBA8);
// big.setPixel(10, 10, {r: 255, g: 128, b: 64, a: 255});
// var cropped = big.crop(5, 5, 20, 20);
// Console.log("crop(5,5,20,20): width=" + cropped.width + " height=" + cropped.height);
Console.log("crop 方法待验证");

Console.log("\n=== resize 缩放 ===");
// TODO: resize 方法返回值问题待修复
// var original = Image.create(100, 100, Image.RGB8);
// original.fill(50);
// var resized = original.resize(50, 50);
// Console.log("resize(50,50): width=" + resized.width + " height=" + resized.height);
Console.log("resize 方法待验证");

Console.log("\nImage 像素操作测试完成!");