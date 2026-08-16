// Image 基础：像素格式常量、工厂模式创建
Console.log("=== Image 像素格式常量 ===");
Console.log("Image.RGBA8:", Image.RGBA8);
Console.log("Image.RGB8:", Image.RGB8);
Console.log("Image.GRAY8:", Image.GRAY8);
Console.log("Image.FLOAT32:", Image.FLOAT32);

Console.log("\n=== 工厂模式创建 Image ===");
var img1 = Image.create(100, 50, Image.RGB8);
Console.log("Image.create(100, 50, Image.RGB8):");
Console.log("  width:", img1.width, "height:", img1.height, "format:", img1.format, "channels:", img1.channels);

var img2 = Image.create(200, 100, Image.RGBA8);
Console.log("Image.create(200, 100, Image.RGBA8):");
Console.log("  width:", img2.width, "height:", img2.height, "format:", img2.format, "channels:", img2.channels);

var img3 = Image.create(64, 64, Image.GRAY8);
Console.log("Image.create(64, 64, Image.GRAY8):");
Console.log("  width:", img3.width, "height:", img3.height, "format:", img3.format, "channels:", img3.channels);

var img4 = Image.create(32, 32, Image.FLOAT32);
Console.log("Image.create(32, 32, Image.FLOAT32):");
Console.log("  width:", img4.width, "height:", img4.height, "format:", img4.format);

Console.log("\n=== 字符串格式兼容 ===");
var img5 = Image.create(100, 50, "rgb8");
Console.log("Image.create(100, 50, \"rgb8\"):", "format:", img5.format);

Console.log("\n=== 禁用 new Image() 构造 ===");
var badResult = new Image(100, 50, "rgb8");
Console.log("new Image() 返回:", badResult);

Console.log("\n=== copy / clone ===");
var imgCopy = img1.copy();
Console.log("img1.copy(): width:", imgCopy.width, "format:", imgCopy.format);
var imgClone = img2.clone();
Console.log("img2.clone(): width:", imgClone.width, "format:", imgClone.format);

Console.log("\nImage 基础测试完成!");
