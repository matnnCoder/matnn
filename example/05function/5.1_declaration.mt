function add(a, b) {
    return a + b;
}

function multiply(a, b) {
    return a * b;
}

function greet(name) {
    return "Hello, " + name + "!";
}

Console.log("add(2, 3) =", add(2, 3));
Console.log("multiply(4, 5) =", multiply(4, 5));
Console.log("greet(Matnn) =", greet("Matnn"));

function sumArray(arr) {
    let total = 0;
    for (let i = 0; i < arr.length; i++) {
        total = total + arr[i];
    }
    return total;
}
Console.log("sumArray([1,2,3,4,5]) =", sumArray([1, 2, 3, 4, 5]));
