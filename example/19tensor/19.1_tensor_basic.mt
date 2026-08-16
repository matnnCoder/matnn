Console.log("=== Tensor 基础创建 ===");
let t1 = new Tensor([2, 3]);
Console.log("new Tensor([2,3]):", t1.toString());
let t2 = new Tensor([2, 2], [1, 2, 3, 4]);
Console.log("new Tensor([2,2], [1,2,3,4]):", t2.toString());
let zeros = Tensor.zeros([3, 3]);
Console.log("Tensor.zeros([3,3]):", zeros.toString());
let ones = Tensor.ones([2, 4]);
Console.log("Tensor.ones([2,4]):", ones.toString());
let arange = Tensor.arange(0, 10, 2);
Console.log("Tensor.arange(0,10,2):", arange.toString());
let rand = Tensor.rand([2, 2]);
Console.log("Tensor.rand([2,2]):", rand.toString());
let randn = Tensor.randn([2, 3]);
Console.log("Tensor.randn([2,3]):", randn.toString());

Console.log("\n=== Tensor 属性 ===");
let t3 = new Tensor([3, 4], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
Console.log("t3:", t3.toString());
Console.log("t3.shape:", t3.shape);
Console.log("t3.size:", t3.size);
Console.log("t3.dim:", t3.dim);
Console.log("t3.dtype:", t3.dtype);

Console.log("\n=== Tensor 形状操作 ===");
let t4 = new Tensor([2, 6], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
Console.log("t4 (2x6):", t4.toString());
let t4_reshaped = t4.reshape([3, 4]);
Console.log("t4.reshape([3,4]):", t4_reshaped.toString());
let t4_flat = t4.flatten();
Console.log("t4.flatten():", t4_flat.toString());

Console.log("\n=== Tensor 复制与转换 ===");
let t5 = new Tensor([2, 2], [1, 2, 3, 4]);
let t5Copy = t5.copy();          // 推荐用法（深拷贝）
Console.log("t5.copy():", t5Copy.toString());

let t5_list = t5.toList();
Console.log("t5.toList():", t5_list);

Console.log("\n=== Tensor 统计操作 ===");
let t6 = new Tensor([2, 3], [1, 2, 3, 4, 5, 6]);
Console.log("t6:", t6.toString());
let t6_sum = t6.sum();
Console.log("t6.sum():", t6_sum);
let t6_mean = t6.mean();
Console.log("t6.mean():", t6_mean);
let t6_min = t6.min();
Console.log("t6.min():", t6_min);
let t6_max = t6.max();
Console.log("t6.max():", t6_max);