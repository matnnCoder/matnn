// Debug resize deeply
Console.log("=== Deep Debug ===");
var big = Image.create(100, 100, Image.RGB8);
Console.log("big:", big);
Console.log("big.width:", big.width);

// Test resize
var resized = big.resize(50, 50);
Console.log("resized raw:", resized);
Console.log("resized type:", typeof resized);

// Try accessing property
if (resized != null) {
    Console.log("resized.width:", resized.width);
}

// Compare with copy
var copied = big.copy();
Console.log("copied:", copied);
Console.log("copied.width:", copied.width);