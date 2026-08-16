// Image 异步文件读写：save / fromFile 返回 TaskHandle
Console.log("=== Image 异步保存 save ===");

var img = Image.create(100, 50, Image.RGB8);
img.fill(128);

// save 返回 TaskHandle，通过 Task.wait 等待完成
var saveTask = img.save("./test_output.bmp");
Console.log("save task type:", typeof saveTask);
Task.wait(saveTask);
Console.log("save 完成, code:", saveTask.code, "msg:", saveTask.msg);

Console.log("\n=== Image 异步加载 fromFile ===");

// fromFile 返回 TaskHandle，通过 Task.wait 等待完成
var loadTask = Image.fromFile("./test_output.bmp");
Console.log("load task type:", typeof loadTask);
Task.wait(loadTask);
Console.log("load 完成, code:", loadTask.code);

var loadedImg = loadTask.result;
if (loadedImg) {
    Console.log("loaded image: width=" + loadedImg.width + " height=" + loadedImg.height + " format=" + loadedImg.format);
    var p = loadedImg.getPixel(10, 10);
    Console.log("loaded pixel(10,10): r=" + p.r + " g=" + p.g + " b=" + p.b);
}

Console.log("\n=== PGM 灰度图异步读写 ===");
var gray = Image.create(16, 16, Image.GRAY8);
gray.fill(200);
gray.setPixel(8, 8, 0);

var graySaveTask = gray.save("./test_gray_out.pgm");
Task.wait(graySaveTask);
Console.log("gray save 完成, code:", graySaveTask.code);

var grayLoadTask = Image.fromFile("./test_gray_out.pgm");
Task.wait(grayLoadTask);
Console.log("gray load 完成, code:", grayLoadTask.code);

var loadedGray = grayLoadTask.result;
if (loadedGray) {
    Console.log("loaded gray: width=" + loadedGray.width + " height=" + loadedGray.height + " format=" + loadedGray.format);
    var gp = loadedGray.getPixel(8, 8);
    Console.log("loaded gray pixel(8,8): " + gp.value);
}

Console.log("\nImage 异步文件读写测试完成!");
