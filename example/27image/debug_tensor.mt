Console.log("=== fromTensor test ===");
var t = Tensor.ones([100, 100, 3]);
var img = Image.fromTensor(t, Image.RGB8);
Console.log("fromTensor width:", img.width);
Console.log("fromTensor height:", img.height);

var resized = img.resize(50, 50);
Console.log("resized width:", resized.width);
Console.log("resized height:", resized.height);

var cropped = img.crop(10, 10, 30, 30);
Console.log("cropped width:", cropped.width);

Console.log("=== Done ===");
