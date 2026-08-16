Console.log("=== JSON 对象 ===");

Console.log("\n--- JSON.stringify 序列化 ---");

var person = {
    name: "Alice",
    age: 30,
    city: "Shanghai",
    hobbies: ["reading", "coding", "travel"],
    isStudent: false
};

var jsonStr = JSON.stringify(person);
Console.log("序列化后的 JSON 字符串:", jsonStr);

Console.log("\n--- JSON.parse 反序列化 ---");

var parsedPerson = JSON.parse(jsonStr);
Console.log("反序列化后的对象:", parsedPerson);
Console.log("parsedPerson.name:", parsedPerson.name);
Console.log("parsedPerson.hobbies:", parsedPerson.hobbies);

Console.log("\n--- 复杂对象序列化 ---");

var complexObj = {
    data: {
        users: [
            {"id": 1, "name": "Alice"},
            {"id": 2, "name": "Bob"}
        ],
        meta: {
            total: 2,
            page: 1
        }
    },
    success: true
};

var complexJson = JSON.stringify(complexObj);
Console.log("复杂对象的 JSON:", complexJson);

var parsedComplex = JSON.parse(complexJson);
Console.log("解析后 data.users[0].name:", parsedComplex.data.users[0].name);
Console.log("解析后 success:", parsedComplex.success);

Console.log("\n--- 数组序列化 ---");

var arr = [1, 2, 3, "four", "five"];
var arrJson = JSON.stringify(arr);
Console.log("数组的 JSON:", arrJson);
var parsedArr = JSON.parse(arrJson);
Console.log("解析后数组:", parsedArr);

Console.log("\n--- 嵌套对象 ---");

var nested = {
    outer: {
        inner: {
            value: 42
        }
    }
};

var nestedJson = JSON.stringify(nested);
Console.log("嵌套对象的 JSON:", nestedJson);
var parsedNested = JSON.parse(nestedJson);
Console.log("解析后 nested.outer.inner.value:", parsedNested.outer.inner.value);