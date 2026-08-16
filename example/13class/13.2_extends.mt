Console.log("=== 类继承 (extends/super) ===");

class Animal {
    constructor(name) {
        this.name = name;
    }

    speak() {
        return this.name + " makes a noise.";
    }
}

class Dog extends Animal {
    constructor(name, breed) {
        super(name);
        this.breed = breed;
    }

    speak() {
        return this.name + " barks. Breed: " + this.breed;
    }
}

class Cat extends Animal {
    constructor(name) {
        super(name);
    }

    speak() {
        return this.name + " meows.";
    }
}

var dog = new Dog("Buddy", "Golden Retriever");
Console.log("dog.speak():", dog.speak());

var cat = new Cat("Mittens");
Console.log("cat.speak():", cat.speak());

Console.log("\n=== 静态方法 (static) ===");

class MathUtils {
    static add(a, b) {
        return a + b;
    }

    static multiply(a, b) {
        return a * b;
    }

    static square(n) {
        return n * n;
    }
}

Console.log("MathUtils.add(2, 3):", MathUtils.add(2, 3));
Console.log("MathUtils.multiply(4, 5):", MathUtils.multiply(4, 5));
Console.log("MathUtils.square(6):", MathUtils.square(6));

Console.log("\n=== 多层继承 ===");

class Shape {
    constructor(color) {
        this.color = color;
    }

    getColor() {
        return this.color;
    }
}

class Circle extends Shape {
    constructor(color, radius) {
        super(color);
        this.radius = radius;
    }

    getArea() {
        return Math.PI * this.radius * this.radius;
    }
}

var circle = new Circle("red", 5);
Console.log("circle.getColor():", circle.getColor());
Console.log("circle.getArea():", circle.getArea());