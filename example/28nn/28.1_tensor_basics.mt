// ============================================================
// 28.1 - NN 基础：Tensor 算子演练（所有神经网络的底层前提）
// 演示：zeros/ones/randn/uniform 初始化、算术、广播、matmul、shape
// ============================================================
Console.log("====== 28.1 NN 基础：Tensor 算子 ======\n");

// ------------------------------
// 1. 初始化工厂（替代手动赋值）
// ------------------------------
Console.log("--- 初始化工厂 ---");
var z = Tensor.zeros([2, 3]);
Console.log("Tensor.zeros([2,3]):\n" + z.toString());

var o = Tensor.ones([3]);
Console.log("Tensor.ones([3]):\n" + o.toString());

var rn = Tensor.randn([2, 2]);  // 标准正态
Console.log("Tensor.randn([2,2]) ~ N(0,1):\n" + rn.toString());

var uf = Tensor.uniform([4], 0.0, 10.0);
Console.log("Tensor.uniform([4], 0, 10):\n" + uf.toString());

// ------------------------------
// 2. 算术运算 + 广播
// ------------------------------
Console.log("\n--- 算术运算 + 广播 ---");
var a = new Tensor([2, 2], [1, 2, 3, 4]);
var b = new Tensor([2, 2], [10, 20, 30, 40]);
Console.log("a =\n" + a.toString());
Console.log("b =\n" + b.toString());
Console.log("a + b =\n" + a.add(b).toString());
Console.log("a - b =\n" + a.sub(b).toString());
Console.log("a * b =\n" + a.mul(b).toString());
Console.log("a / b =\n" + a.div(b).toString());

// 广播：形状 [2,2] + [2] -> [2,2]
var bias = new Tensor([2], [100, 200]);
Console.log("broadcast: a + bias =\n" + a.add(bias).toString());

// ------------------------------
// 3. 矩阵乘法（matmul / dot）：全连接层核心
// ------------------------------
Console.log("\n--- 矩阵乘法 matmul ---");
var x = new Tensor([2, 3], [1, 2, 3,   // batch 0
                            4, 5, 6]); // batch 1  shape=(2,3)
var w = new Tensor([3, 2], [0.1, 0.2,   // shape=(3,2)  输入3维 -> 输出2维
                            0.3, 0.4,
                            0.5, 0.6]);
var y = x.matmul(w);  // (2,3) @ (3,2) = (2,2)
Console.log("x shape=" + x.shape + ":\n" + x.toString());
Console.log("w shape=" + w.shape + ":\n" + w.toString());
Console.log("y = x @ w, shape=" + y.shape + ":\n" + y.toString());

// ------------------------------
// 4. 形状操作
// ------------------------------
Console.log("\n--- 形状操作 ---");
var img = Tensor.randn([2, 3, 4, 4]); // (N,C,H,W)=(2,3,4,4) 的模拟图片
Console.log("img shape: " + img.shape);
var flat = img.flatten();
Console.log("img.flatten() shape: " + flat.shape);
var flat1 = img.reshape([2, 3*4*4]);
Console.log("img.reshape([2, 3*4*4]) shape: " + flat1.shape);
var t = new Tensor([2, 3], [1,2,3, 4,5,6]);
var tt = t.transpose();
Console.log("t=\n" + t.toString());
Console.log("t.transpose()=\n" + tt.toString());

// ------------------------------
// 5. 激活函数（非线性变换）
// ------------------------------
Console.log("\n--- 激活函数 ---");
var act = new Tensor([3], [-2.0, 0.0, 3.0]);
Console.log("act = " + act.toList());
Console.log("relu = " + act.relu().toList());
Console.log("sigmoid = " + act.sigmoid().toList());
Console.log("tanh = " + act.tanh().toList());
var logits = new Tensor([3], [1.0, 2.0, 3.0]);
Console.log("softmax([1,2,3]) = " + logits.softmax().toList());

// ------------------------------
// 6. 归约统计
// ------------------------------
Console.log("\n--- 归约统计 ---");
var stat = new Tensor([2, 3], [1, 2, 3, 4, 5, 6]);
Console.log("stat.sum() = " + stat.sum());
Console.log("stat.mean() = " + stat.mean());
Console.log("stat.max() = " + stat.max() + ", min() = " + stat.min());
Console.log("stat.argmax() = " + stat.argmax().toList());

Console.log("\n====== 28.1 完成 ======");
