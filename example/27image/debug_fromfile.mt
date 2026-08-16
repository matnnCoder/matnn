Console.log("=== fromFile test ===");
var loadTask = Image.fromFile("d:\\work\\myfile\\matnn\\matnn_example\\example\\27image\\test_output.bmp");
Task.wait(loadTask);
Console.log("load code:", loadTask.code);
var loadedImg = loadTask.result;
if (loadedImg) {
    Console.log("loaded width:", loadedImg.width);
    Console.log("loaded height:", loadedImg.height);
    Console.log("loaded format:", loadedImg.format);
} else {
    Console.log("loadedImg is null");
}
Console.log("=== Done ===");
