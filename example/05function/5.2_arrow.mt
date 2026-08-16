let add = (a, b) => a + b;
let doubleNum = x => x * 2;
let greet = name => `Hello, ${name}!`;
Console.log("add(2, 3) =", add(2, 3));
Console.log("doubleNum(5) =", doubleNum(5));
Console.log("greet(Matnn) =", greet("Matnn"));
let sumArray = arr => {
  let total = 0;
  for (let i = 0; i < arr.length; i++) {
    total = total + arr[i];
  }
  return total
};
Console.log("sumArray([1,2,3,4,5]) =", sumArray([1, 2, 3, 4, 5]));
let multiply = (a, b) => a * b;
Console.log("multiply(4, 6) =", multiply(4, 6));
let isEven = n => n % 2 == 0;
Console.log("isEven(4) =", isEven(4));
Console.log("isEven(5) =", isEven(5));
let createPerson = (name, age) => ({name: name, age: age});
let p = createPerson("Alice", 30);
Console.log("createPerson(Alice, 30).name =", p.name);
Console.log("createPerson(Alice, 30).age =", p.age);
