// ============================================================
// 28.3 - Nn.Sequential 顺序容器：堆叠 MLP / 小型 CNN
// 演示：组合多层 -> 一次 forward，检查输出形状；train() / eval() 批量模式切换
// ============================================================
Console.log("====== 28.3 Sequential 模型堆叠 ======\n");
var i;
var ps_len;

// ------------------------------
// 1. 搭建 MLP：784 -> 256 -> ReLU -> 64 -> ReLU -> 10
// ------------------------------
Console.log("--- MLP ---");
var mlp = Nn.sequential(
    Nn.linear(784, 256),
    Nn.relu(),
    Nn.linear(256, 64),
    Nn.relu(),
    Nn.linear(64, 10)
);

var imgFlat = Tensor.randn([4, 784]);
var logits = mlp.forward(imgFlat);
Console.log("MLP input shape: " + imgFlat.shape);
Console.log("MLP output shape: " + logits.shape + "  (expect [4, 10])");
var ps = mlp.parameters();
var totalParam = 0;
for (i = 0; i < ps.length; i++) {
    totalParam += ps[i].size;
}
Console.log("MLP total parameter count: " + totalParam);

// ------------------------------
// 2. 搭建小型 CNN：Conv+Pool+Flatten+Linear
// ------------------------------
Console.log("\n--- CNN ---");
var hc = 8 * 4 * 4;
var cnn = Nn.sequential(
    Nn.conv2d(3, 8, 3, 3, 1, 1, true),
    Nn.relu(),
    Nn.maxPool2d(2, 2, 2, 0),
    Nn.flatten(),
    Nn.linear(hc, 10)
);

var images = Tensor.randn([2, 3, 8, 8]);
var cnnOut = cnn.forward(images);
Console.log("CNN input shape: " + images.shape);
Console.log("CNN output shape: " + cnnOut.shape + "  (expect [2, 10])");

// ------------------------------
// 3. 模式切换 train() / eval()：影响 Dropout、BatchNorm
// ------------------------------
Console.log("\n--- train() / eval() ---");
var withDrop = Nn.sequential(
    Nn.linear(6, 4),
    Nn.dropout(0.6),
    Nn.relu(),
    Nn.linear(4, 2)
);
var xd = Tensor.ones([1, 6]);

withDrop.train();
Console.log("train mode:");
for (i = 0; i < 3; i++) {
    var o1 = withDrop.forward(xd);
    Console.log("  forward #" + i + ": " + o1.toList() + " (non-deterministic with dropout)");
}
withDrop.eval();
Console.log("eval mode:");
for (i = 0; i < 3; i++) {
    var o2 = withDrop.forward(xd);
    Console.log("  forward #" + i + ": " + o2.toList() + " (deterministic, same)");
}

Console.log("\n====== 28.3 完成 ======");
