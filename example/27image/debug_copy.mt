// Debug copy
Console.log("=== Debug copy ===");
var big = Image.create(100, 100, Image.RGBA8);
Console.log("big.width:", big.width);

var copied = big.copy();
Console.log("copied type:", typeof copied);
Console.log("copied:", copied);
Console.log("copied.width:", copied.width);