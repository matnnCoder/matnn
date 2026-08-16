Console.log("=== Euler 欧拉角 ===");
var euler1 = new Euler();
var px = Math.PI / 4;
var py = Math.PI / 6;
var pz = Math.PI / 3;
euler1.set(px, py, pz);
Console.log("euler1:", euler1.toString());

Console.log("\n=== Quat 四元数 ===");
var quat1 = new Quat();
quat1.identity();
Console.log("quat1 identity:", quat1.toString());
var quat2 = new Quat();
var ax = Math.PI / 4;
quat2.rotateX(ax);
Console.log("quat2.rotateX(PI/4):", quat2.toString());

Console.log("\n=== Color 颜色 ===");
var color1 = new Color(1, 0, 0);
Console.log("color1 red:", color1.toString());
var color2 = new Color();
color2.set(0.5, 0.5, 0.5);
Console.log("color2.set(0.5,0.5,0.5):", color2.toString());