// ============================================================
// 28.5 - 训练闭环 Demo：用 MLP 拟合 y = Wx + b
// ============================================================
Console.log("====== 28.5 训练闭环：拟合 y = 2x + 3 + noise ======\n");
let i;

let numEpochs = 10;
let learningRate = 0.05;
let numSamples = 32;
let wTrue = 2.0;
let bTrue = 3.0;

// 用纯张量运算构造 y = W*x + b，避免逐元素 get/set
Console.log("--- Generate dataset (y = " + wTrue + "x + " + bTrue + " + 0.1*noise) ---");
let xData = Tensor.randn([numSamples, 1]);
let wTensor = Tensor.full([1], wTrue);
let bTensor = Tensor.full([1], bTrue);
let wVal = wTensor.toList()[0];
let bVal = bTensor.toList()[0];
let yData = xData.multiply(wVal).add(bVal);
let noise = Tensor.randn([numSamples, 1]).multiply(0.1);
yData = yData.add(noise);

let xList = xData.toList();
let yList = yData.toList();
Console.log("First 5 samples (x, y_true):");
for (i = 0; i < 5; i++) {
    Console.log("  (" + xList[i] + ", " + yList[i] + ")");
}

Console.log("\n--- Build model: Linear(1, 8) + ReLU + Linear(8, 1) ---");
let model = Nn.sequential(
    Nn.linear(1, 8),
    Nn.relu(),
    Nn.linear(8, 1)
);
let criterion = Nn.mseLoss();
let optim = Nn.sgd(model.parameters(), learningRate, 0.9, 0.0);

Console.log("\n--- Training loop numEpochs=" + numEpochs + " (full-batch) ---");
model.train();
for (i = 0; i < numEpochs; i++) {
    optim.zeroGrad(model);
    let predT = model.forward(xData);
    let lossT = criterion.forward(predT, yData);
    let lossList = lossT.toList();
    let avgLoss = lossList[0];

    // [autograd placeholder] lossT.backward();
    optim.step(model);

    Console.log("epoch " + i + "  |  avg MSE loss = " + avgLoss);
}

Console.log("\n--- Inference: eval() ---");
model.eval();
let yPredT = model.forward(xData);
let yPredList = yPredT.toList();

Console.log("Predict vs True (x, y_pred, y_true)  [first 5]:");
for (i = 0; i < 5; i++) {
    Console.log("  x=" + xList[i] + "  y_pred=" + yPredList[i] + "  y_true=" + yList[i]);
}

let noteStr =
    "\nNote: Once Tensor.requires_grad / .grad / backward() are fully wired,\n" +
    "loss will decrease epoch by epoch and y_pred will converge to y_true.\n";
Console.log(noteStr);
Console.log("====== 28.5 完成 ======");
