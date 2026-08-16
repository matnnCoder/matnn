var person = {
    name: "Alice",
    age: 30,
    city: "Shanghai"
};

Console.log("对象:", person);
Console.log("姓名:", person.name);
Console.log("年龄:", person.age);
Console.log("城市:", person.city);

person.age = 31;
Console.log("修改年龄后的对象:", person);

var car = {
    brand: "Tesla",
    model: "Model 3",
    year: 2023
};
person.car=car;
Console.log("汽车:", car);
Console.log("Alice有汽车:", person);
