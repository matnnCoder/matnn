// Image 与 Tensor 零拷贝转换
Console.log("=== Image 转 Tensor ===");
var img = Image.create(10, 10, Image.RGBA8);
img.setPixel(0, 0, {r: 255, g: 128, b: 64, a: 255});

var tensor = img.toTensor();
Console.log("toTensor() type:", typeof tensor);
Console.log("tensor.shape:", tensor.shape);
Console.log("tensor.size:", tensor.size);
Console.log("tensor.dim:", tensor.dim);

Console.log("\n=== Tensor 转 Image（fromTensor）===");
var imgFromT = Image.fromTensor(tensor, Image.RGBA8);
Console.log("fromTensor width:", imgFromT.width);
Console.log("fromTensor height:", imgFromT.height);
Console.log("fromTensor format:", imgFromT.format);

var p = imgFromT.getPixel(0, 0);
Console.log("fromTensor pixel(0,0): r=" + p.r + " g=" + p.g + " b=" + p.b + " a=" + p.a);

Console.log("\n=== RGB8 零拷贝转换 ===");
var rgb = Image.create(20, 20, Image.RGB8);
rgb.fill(100);
rgb.setPixel(5, 5, {r: 200, g: 50, b: 150});

var rgbTensor = rgb.toTensor();
Console.log("rgb tensor.shape:", rgbTensor.shape);

var rgbBack = Image.fromTensor(rgbTensor, Image.RGB8);
var rp = rgbBack.getPixel(5, 5);
Console.log("rgb fromTensor pixel(5,5): r=" + rp.r + " g=" + rp.g + " b=" + rp.b);

Console.log("\n=== Tensor 直接操作 Image 底层数据 ===");
var baseImg = Image.create(4, 4, Image.GRAY8);
baseImg.fill(50);
var baseTensor = baseImg.toTensor();
Console.log("修改前 pixel(0,0):", baseImg.getPixel(0, 0).value);
baseTensor.set(0, 255);
Console.log("修改后 pixel(0,0):", baseImg.getPixel(0, 0).value);

Console.log("\nImage Tensor 零拷贝测试完成!");
