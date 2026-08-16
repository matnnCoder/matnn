Console.log("=== 类定义 (class) ===");
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  greet() {
    return "Hello, my name is " + this.name + ", I'm " + this.age + " years old."
  }
  getInfo() {
    return {name: this.name, age: this.age}
  }
}
let p1 = new Person("Alice", 30);
Console.log("p1.greet():", p1.greet());
Console.log("p1.getInfo():", p1.getInfo());
Console.log("p1.name:", p1.name);
Console.log("p1.age:", p1.age);
Console.log("\n=== 类的实例化 ===");
let p2 = new Person("Bob", 25);
Console.log("p2.greet():", p2.greet());
Console.log("\n=== 修改实例属性 ===");
p1.age = 31;
Console.log("修改年龄后 p1.greet():", p1.greet());
Console.log("\n=== this 关键字 ===");
class Car {
  constructor(brand, model) {
    this.brand = brand;
    this.model = model;
  }
  describe() {
    return "This is a " + this.brand + " " + this.model
  }
}
let myCar = new Car("Tesla", "Model 3");
Console.log("myCar.describe():", myCar.describe());

