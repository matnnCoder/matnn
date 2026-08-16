Console.log("=== TVec4 四维张量向量 ===");

var v4 = new TVec4(1, 2, 3, 4);
Console.log("v4 = new TVec4(1, 2, 3, 4)");
Console.log("v4.toString():", v4.toString());
Console.log("v4.x:", v4.x);
Console.log("v4.y:", v4.y);
Console.log("v4.z:", v4.z);
Console.log("v4.w:", v4.w);

var v4_2 = new TVec4(5, 6, 7, 8);
var v4_add = v4.add(v4_2);
Console.log("\nv4.add(v4_2):", v4_add.toString());

var v4_sub = v4.sub(v4_2);
Console.log("v4.sub(v4_2):", v4_sub.toString());

var v4_mul = v4.multiply(2);
Console.log("v4.multiply(2):", v4_mul.toString());

var v4_dot = v4.dot(v4_2);
Console.log("v4.dot(v4_2):", v4_dot);

var v4_len = v4.len();
Console.log("v4.len():", v4_len);

var v4_norm = v4.normalize();
Console.log("v4.normalize():", v4_norm.toString());

var v4_clone = v4.clone();
Console.log("v4.clone():", v4_clone.toString());

var v4_neg = v4.negate();
Console.log("v4.negate():", v4_neg.toString());

var v4_dist = v4.distance(v4_2);
Console.log("v4.distance(v4_2):", v4_dist);

Console.log("\n=== TMat3 3x3 张量矩阵 ===");

var m3 = new TMat3();
m3.identity();
Console.log("m3.identity():", m3.toString());

var m3_rot = new TMat3();
m3_rot.identity().rotate(Math.PI / 4, new TVec4(0, 0, 1, 0));
Console.log("m3_rot (45度绕Z轴):", m3_rot.toString());

var m3_scale = new TMat3();
m3_scale.identity().scale(new TVec4(2, 3, 1, 0));
Console.log("m3_scale (x*2, y*3):", m3_scale.toString());

var m3_det = m3.determinant();
Console.log("m3.determinant():", m3_det);

var m3_t = m3.transpose();
Console.log("m3.transpose():", m3_t.toString());

var m3_clone = m3.clone();
Console.log("m3.clone():", m3_clone.toString());

Console.log("\n=== TMat4 4x4 张量矩阵 ===");

var m4 = new TMat4();
m4.identity();
Console.log("m4.identity():", m4.toString());

var m4_trans = new TMat4();
m4_trans.identity().translate(new TVec4(10, 20, 30, 0));
Console.log("m4_trans (translate):", m4_trans.toString());

var m4_rot = new TMat4();
m4_rot.identity().rotate(Math.PI / 6, new TVec4(0, 1, 0, 0));
Console.log("m4_rot (30度绕Y轴):", m4_rot.toString());

var m4_scale = new TMat4();
m4_scale.identity().scale(new TVec4(2, 2, 2, 0));
Console.log("m4_scale (uniform scale 2):", m4_scale.toString());

var m4_det = m4.determinant();
Console.log("m4.determinant():", m4_det);

var m4_t = m4.transpose();
Console.log("m4.transpose():", m4_t.toString());

var m4_clone = m4.clone();
Console.log("m4.clone():", m4_clone.toString());

var m4_mul = m4_trans.multiply(m4_scale);
Console.log("m4_trans.multiply(m4_scale):", m4_mul.toString());

Console.log("\n=== Tensor 转换为数学对象 ===");

var t_vec2 = Tensor.ones([2]);
t_vec2.setitem([0], 3);
t_vec2.setitem([1], 4);
var v2 = t_vec2.asTVec2();
Console.log("Tensor [3, 4].asTVec2():", v2.toString());

var t_vec3 = Tensor.ones([3]);
t_vec3.setitem([0], 1);
t_vec3.setitem([1], 2);
t_vec3.setitem([2], 3);
var v3 = t_vec3.asTVec3();
Console.log("Tensor [1, 2, 3].asTVec3():", v3.toString());

var t_vec4 = Tensor.ones([4]);
t_vec4.setitem([0], 1);
t_vec4.setitem([1], 2);
t_vec4.setitem([2], 3);
t_vec4.setitem([3], 4);
var v4_from_tensor = t_vec4.asTVec4();
Console.log("Tensor [1, 2, 3, 4].asTVec4():", v4_from_tensor.toString());

var t_mat3 = Tensor.zeros([3, 3]);
t_mat3.setitem([0, 0], 1);
t_mat3.setitem([1, 1], 1);
t_mat3.setitem([2, 2], 1);
var m3_from_tensor = t_mat3.asTMat3();
Console.log("Tensor (3x3 identity).asTMat3():", m3_from_tensor.toString());

var t_mat4 = Tensor.zeros([4, 4]);
t_mat4.setitem([0, 0], 1);
t_mat4.setitem([1, 1], 1);
t_mat4.setitem([2, 2], 1);
t_mat4.setitem([3, 3], 1);
var m4_from_tensor = t_mat4.asTMat4();
Console.log("Tensor (4x4 identity).asTMat4():", m4_from_tensor.toString());
