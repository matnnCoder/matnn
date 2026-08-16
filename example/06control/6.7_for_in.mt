Console.log("=== for-in 循环遍历对象 ===");

var person = {
    name: "Alice",
    age: 30,
    city: "Shanghai",
    job: "Developer"
};

for (var key in person) {
    Console.log("key:", key, ", value:", person[key]);
}

Console.log("\n=== for-in 循环遍历数组 ===");

var arr = ["apple", "banana", "orange", "grape"];
for (var index in arr) {
    Console.log("index:", index, ", value:", arr[index]);
}

Console.log("\n=== 使用 hasOwnProperty 检查属性 ===");

var car = {
    brand: "Tesla",
    model: "Model 3",
    year: 2023
};

for (var prop in car) {
    if (car.hasOwnProperty(prop)) {
        Console.log("自有属性: ", prop, "=", car[prop]);
    }
}