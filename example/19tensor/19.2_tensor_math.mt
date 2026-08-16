Console.log("=== Tensor 算术运算 ===");
var t1 = new Tensor([2, 2], [1, 2, 3, 4]);
var t2 = new Tensor([2, 2], [5, 6, 7, 8]);
Console.log("t1:", t1.toString());
Console.log("t2:", t2.toString());
var t_add = t1.add(t2);
Console.log("t1.add(t2):", t_add.toString());
var t_sub = t1.sub(t2);
Console.log("t1.sub(t2):", t_sub.toString());
var t_mul = t1.multiply(t2);
Console.log("t1.multiply(t2):", t_mul.toString());
var t_div = t1.divide(t2);
Console.log("t1.divide(t2):", t_div.toString());

Console.log("\n=== Tensor 标量运算 ===");
var t3 = new Tensor([2, 2], [1, 2, 3, 4]);
Console.log("t3:", t3.toString());
var t_add_scalar = t3.add(10);
Console.log("t3.add(10):", t_add_scalar.toString());
var t_mul_scalar = t3.multiply(2);
Console.log("t3.multiply(2):", t_mul_scalar.toString());
var t_div_scalar = t3.divide(2);
Console.log("t3.divide(2):", t_div_scalar.toString());

Console.log("\n=== Tensor 矩阵运算 ===");
var t4 = new Tensor([2, 3], [1, 2, 3, 4, 5, 6]);
var t5 = new Tensor([3, 2], [7, 8, 9, 10, 11, 12]);
Console.log("t4 (2x3):", t4.toString());
Console.log("t5 (3x2):", t5.toString());
var t_dot = t4.dot(t5);
Console.log("t4.dot(t5) (2x2):", t_dot.toString());
var t6 = new Tensor([2, 2], [1, 2, 3, 4]);
var t6_t = t6.transpose();
Console.log("t6:", t6.toString());
Console.log("t6.transpose():", t6_t.toString());

Console.log("\n=== Tensor 幂运算 ===");
var t7 = new Tensor([2, 2], [1, 2, 3, 4]);
Console.log("t7:", t7.toString());
var t_pow2 = t7.pow(2);
Console.log("t7.pow(2):", t_pow2.toString());
var t_pow05 = t7.pow(0.5);
Console.log("t7.pow(0.5):", t_pow05.toString());

Console.log("\n=== Tensor 数学函数 ===");
var t8 = new Tensor([2, 3], [-1, 0, 1, 2, 3, 4]);
Console.log("t8:", t8.toString());
var t_abs = t8.abs();
Console.log("t8.abs():", t_abs.toString());
var t_sqrt = t8.abs().sqrt();
Console.log("abs(t8).sqrt():", t_sqrt.toString());

Console.log("\n=== Tensor 三角函数 ===");
var t9 = new Tensor([1, 4], [0, Math.PI / 6, Math.PI / 4, Math.PI / 3]);
Console.log("t9 (角度):", t9.toString());
var t_sin = t9.sin();
Console.log("t9.sin():", t_sin.toString());
var t_cos = t9.cos();
Console.log("t9.cos():", t_cos.toString());
var t_tan = t9.tan();
Console.log("t9.tan():", t_tan.toString());

Console.log("\n=== Tensor 指数与对数 ===");
var t10 = new Tensor([1, 3], [1, 2, 3]);
Console.log("t10:", t10.toString());
var t_exp = t10.exp();
Console.log("t10.exp():", t_exp.toString());
var t_log = t10.exp().log();
Console.log("exp(t10).log():", t_log.toString());