Console.log("=== Map 对象 ===");

var map = new Map();
Console.log("new Map():", map);

Console.log("\n=== set() 和 get() ===");
map.set("name", "matnn");
map.set("version", 1.0);
map.set("enabled", true);
Console.log("map.get('name'):", map.get("name"));
Console.log("map.get('version'):", map.get("version"));
Console.log("map.get('enabled'):", map.get("enabled"));
Console.log("map.get('notExists'):", map.get("notExists"));

Console.log("\n=== has() ===");
Console.log("map.has('name'):", map.has("name"));
Console.log("map.has('age'):", map.has("age"));

Console.log("\n=== size ===");
Console.log("map.size:", map.size);

Console.log("\n=== delete() ===");
map.set("temp", "value");
Console.log("map.size before delete:", map.size);
var deleted = map.delete("temp");
Console.log("map.delete('temp'):", deleted);
Console.log("map.size after delete:", map.size);
var notDeleted = map.delete("notExists");
Console.log("map.delete('notExists'):", notDeleted);

Console.log("\n=== clear() ===");
var map2 = new Map();
map2.set("a", 1);
map2.set("b", 2);
Console.log("map2.size before clear:", map2.size);
map2.clear();
Console.log("map2.size after clear:", map2.size);

Console.log("\n=== 复杂键值 ===");
var userMap = new Map();
userMap.set("user_1", {name: "Alice", age: 25});
userMap.set("user_2", {name: "Bob", age: 30});
var user1 = userMap.get("user_1");
Console.log("user_1.name:", user1.name);
Console.log("user_1.age:", user1.age);

Console.log("\n=== 链式调用 ===");
var chainMap = new Map();
chainMap.set("key1", "value1").set("key2", "value2");
Console.log("chainMap.get('key1'):", chainMap.get("key1"));
Console.log("chainMap.get('key2'):", chainMap.get("key2"));
