Console.log("=== Set 对象 ===");

var set = new Set();
Console.log("new Set():", set);

Console.log("\n=== add() ===");
set.add(1);
set.add(2);
set.add(3);
set.add(1);
Console.log("set.size after adding [1,2,3,1]:", set.size);

Console.log("\n=== has() ===");
Console.log("set.has(1):", set.has(1));
Console.log("set.has(4):", set.has(4));

Console.log("\n=== size ===");
Console.log("set.size:", set.size);

Console.log("\n=== delete() ===");
var deleted = set.delete(2);
Console.log("set.delete(2):", deleted);
Console.log("set.size after delete:", set.size);
var notDeleted = set.delete(4);
Console.log("set.delete(4):", notDeleted);

Console.log("\n=== clear() ===");
var set2 = new Set();
set2.add("a");
set2.add("b");
set2.add("c");
Console.log("set2.size before clear:", set2.size);
set2.clear();
Console.log("set2.size after clear:", set2.size);

Console.log("\n=== 字符串元素 ===");
var stringSet = new Set();
stringSet.add("apple");
stringSet.add("banana");
stringSet.add("cherry");
stringSet.add("apple");
Console.log("stringSet.size:", stringSet.size);
Console.log("stringSet.has('banana'):", stringSet.has("banana"));

Console.log("\n=== 混合类型 ===");
var mixedSet = new Set();
mixedSet.add(10);
mixedSet.add("hello");
mixedSet.add(true);
mixedSet.add(10);
Console.log("mixedSet.size:", mixedSet.size);
Console.log("mixedSet.has(10):", mixedSet.has(10));
Console.log("mixedSet.has('hello'):", mixedSet.has("hello"));

Console.log("\n=== 链式调用 ===");
var chainSet = new Set();
chainSet.add("x").add("y").add("z");
Console.log("chainSet.size:", chainSet.size);
Console.log("chainSet.has('y'):", chainSet.has("y"));
