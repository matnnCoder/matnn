var score = 85;
var grade;

if (score >= 90) {
    grade = "A";
} else if (score >= 80) {
    grade = "B";
} else if (score >= 70) {
    grade = "C";
} else {
    grade = "D";
}

Console.log("分数:", score);
Console.log("等级:", grade);

var age = 20;
if (age >= 18) {
    Console.log("成年人");
} else {
    Console.log("未成年人");
}
