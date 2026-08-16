// ============================================================
// 28.2 - NN 单层演示：Linear / Conv2d / 激活 / Pooling / Flatten / Dropout / BatchNorm
// 每一层单独构造、单独 forward，检查输出形状
// ============================================================
Console.log("====== 28.2 NN 单层演示 ======\n");

// ------------------------------
// 1. Nn.Linear 全连接层
// ------------------------------
Console.log("--- Nn.Linear ---");
var linear = Nn.linear(4, 2, true);
Console.log("layer className: " + linear._className);

var x = Tensor.zeros([2, 4]);
x.set(0, 0, 1.0); x.set(0, 1, 2.0); x.set(0, 2, 3.0); x.set(0, 3, 4.0);
x.set(1, 0, 5.0); x.set(1, 1, 6.0); x.set(1, 2, 7.0); x.set(1, 3, 8.0);
var y = linear.forward(x);
Console.log("x shape: " + x.shape);
Console.log("Linear(4->2).forward(x) shape: " + y.shape);

// ------------------------------
// 2. 激活层：ReLU / Sigmoid / Tanh
// ------------------------------
Console.log("\n--- 激活层 ---");
var relu = Nn.relu();
var sig = Nn.sigmoid();
var tah = Nn.tanh();
var feat = Tensor.zeros([3]);
feat.set(0, -1.0); feat.set(1, 0.0); feat.set(2, 2.0);
Console.log("feat = " + feat.toList());
Console.log("ReLU.forward = " + relu.forward(feat).toList());
Console.log("Sigmoid.forward = " + sig.forward(feat).toList());
Console.log("Tanh.forward = " + tah.forward(feat).toList());

// ------------------------------
// 3. Flatten 展平
// ------------------------------
Console.log("\n--- Flatten ---");
var featMap = Tensor.randn([2, 16, 4, 4]);
var flatLayer = Nn.flatten();
var flatOut = flatLayer.forward(featMap);
Console.log("before Flatten: shape=" + featMap.shape);
Console.log("after Flatten:  shape=" + flatOut.shape + "  (expect [2, 256])");

// ------------------------------
// 4. MaxPool2d / AvgPool2d
// ------------------------------
Console.log("\n--- Pooling ---");
var smallImg = Tensor.zeros([1, 1, 4, 4]);
for (var i = 0; i < 16; i++) {
    var r = Math.floor(i / 4);
    var c = i % 4;
    smallImg.set(0, 0, r, c, i + 1.0);
}
var maxp = Nn.maxPool2d(2, 2, 2, 0);
var avgp = Nn.avgPool2d(2, 2, 2, 0);
var mx = maxp.forward(smallImg);
var av = avgp.forward(smallImg);
Console.log("4x4 img MaxPool2d(2,2,2) shape=" + mx.shape + " list=" + mx.toList());
Console.log("4x4 img AvgPool2d(2,2,2) shape=" + av.shape + " list=" + av.toList());

// ------------------------------
// 5. Nn.Conv2d 卷积
// ------------------------------
Console.log("\n--- Nn.Conv2d ---");
var conv = Nn.conv2d(1, 1, 3, 3, 1, 1, false);
var inp = Tensor.zeros([1, 1, 5, 5]);
inp.set(0, 0, 1, 1, 1.0); inp.set(0, 0, 1, 2, 2.0); inp.set(0, 0, 1, 3, 3.0);
inp.set(0, 0, 2, 1, 4.0); inp.set(0, 0, 2, 2, 5.0); inp.set(0, 0, 2, 3, 6.0);
inp.set(0, 0, 3, 1, 7.0); inp.set(0, 0, 3, 2, 8.0); inp.set(0, 0, 3, 3, 9.0);
var convOut = conv.forward(inp);
Console.log("Conv2d in:  shape=" + inp.shape);
Console.log("Conv2d out: shape=" + convOut.shape + "  (expect [1,1,5,5] for s=1 p=1)");

// ------------------------------
// 6. Dropout（训练 vs 推理）
// ------------------------------
Console.log("\n--- Dropout ---");
var drop = Nn.dropout(0.5);
var vec = Tensor.ones([8]);
drop.train();
var trOut = drop.forward(vec);
Console.log("Dropout train() out: " + trOut.toList() + "  (approximately half 0, half 2)");
drop.eval();
var evOut = drop.forward(vec);
Console.log("Dropout eval()  out: " + evOut.toList() + "  (expect all 1)");

// ------------------------------
// 7. BatchNorm2d 批归一化
// ------------------------------
Console.log("\n--- BatchNorm2d ---");
var bn = Nn.batchNorm2d(2, 1e-5, 0.1);
var bnIn = Tensor.uniform([2, 2, 2, 2], 0, 10);
bn.train();
var bnOut = bn.forward(bnIn);
Console.log("BN train(): output per-channel mean ~ 0, var ~ 1");
Console.log("BN train() out shape: " + bnOut.shape);
bn.eval();
var bnEval = bn.forward(bnIn);
Console.log("BN eval()  out shape: " + bnEval.shape + "  (uses running stats)");

Console.log("\n====== 28.2 完成 ======");
